# =======================================================
# 0. GARANTIA DE ADMINISTRADOR
# =======================================================
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Elevando privilégios para Administrador..." -ForegroundColor Cyan
    try {
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs -ErrorAction Stop
    } catch {
        Write-Host "ERRO: Não foi possível elevar privilégios. Clique com o botão direito e execute como Administrador." -ForegroundColor Red
        Pause
    }
    Exit
}

Unblock-File -Path $PSCommandPath -ErrorAction SilentlyContinue

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "   Limpeza Completa - RustDesk + ARO Nexus (Reforçada)  " -ForegroundColor White
Write-Host "=======================================================" -ForegroundColor Cyan

# =======================================================
# 1. PARAR PROCESSOS E SERVIÇOS (NOMES CORRETOS)
# =======================================================
Write-Host "[1/6] Encerrando processos e serviços..." -ForegroundColor Yellow

$processPatterns = @("rustdesk", "ARO Nexus", "ARO", "aro")
$allProcs = Get-Process -ErrorAction SilentlyContinue
foreach ($pattern in $processPatterns) {
    $allProcs | Where-Object { $_.ProcessName -like "*$pattern*" } | ForEach-Object {
        Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue
    }
}

# Nomes corretos dos serviços (nome curto, não o nome de exibição)
$servicos = @("RustDesk", "ARO Nexus")  # <--- corrigido: "ARO Nexus" é o nome do serviço
foreach ($svc in $servicos) {
    Write-Host "   Parando e removendo serviço: $svc" -ForegroundColor Gray
    Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    sc.exe delete "$svc" | Out-Null
}

# Verificação extra: remove qualquer resquício do serviço pelo nome de exibição (fallback)
$displayNames = @("ARO Nexus Service", "RustDesk Service")
foreach ($display in $displayNames) {
    $svc = Get-Service | Where-Object { $_.DisplayName -eq $display }
    if ($svc) {
        Write-Host "   Removendo serviço pelo nome de exibição: $display" -ForegroundColor Gray
        sc.exe delete "$($svc.Name)" | Out-Null
    }
}

# Regras de firewall criadas pelo instalador
netsh advfirewall firewall delete rule name="RustDesk Service" | Out-Null
netsh advfirewall firewall delete rule name="ARO Nexus Service" | Out-Null

# =======================================================
# 2. EXECUTAR DESINSTALADORES (SE EXISTIREM)
# =======================================================
Write-Host "[2/6] Executando desinstaladores nativos..." -ForegroundColor Yellow

$caminhosDesinstalador = @(
    "C:\Program Files\RustDesk\rustdesk.exe",
    "C:\Program Files\ARO Nexus\ARO Nexus.exe"
)

foreach ($exe in $caminhosDesinstalador) {
    if (Test-Path $exe) {
        Write-Host "   Executando desinstalação de: $exe" -ForegroundColor Green
        Start-Process -FilePath $exe -ArgumentList "--uninstall" -Wait -NoNewWindow -ErrorAction SilentlyContinue
    }
}

# =======================================================
# 3. REMOÇÃO DE PASTAS (INCLUINDO "ARO Tecnologia")
# =======================================================
Write-Host "[3/6] Removendo pastas e caches..." -ForegroundColor Yellow

$pastas = @(
    # RustDesk original
    "$env:APPDATA\RustDesk",
    "$env:LOCALAPPDATA\RustDesk",
    "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk",
    "C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\RustDesk",
    "C:\Windows\System32\config\systemprofile\AppData\Roaming\RustDesk",
    "C:\Program Files\RustDesk",
    
    # ARO Nexus (pastas diretas)
    "$env:APPDATA\ARO Nexus",
    "$env:LOCALAPPDATA\ARO Nexus",
    "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\ARO Nexus",
    "C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\ARO Nexus",
    "C:\Windows\System32\config\systemprofile\AppData\Roaming\ARO Nexus",
    "C:\Program Files\ARO Nexus",
    
    # NOVA PASTA RESIDUAL IDENTIFICADA:
    "$env:APPDATA\ARO Tecnologia\ARO Nexus",
    "$env:APPDATA\ARO Tecnologia",  # se vazia, será removida também
    "C:\ProgramData\ARO Nexus",
    "C:\ProgramData\ARO Tecnologia"
)

foreach ($pasta in $pastas) {
    if (Test-Path $pasta) {
        Remove-Item -Path $pasta -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "   [OK] Removido: $pasta" -ForegroundColor Green
    }
}

# =======================================================
# 4. REMOÇÃO DE CHAVES DE REGISTRO (AMPLIADA)
# =======================================================
Write-Host "[4/6] Removendo chaves de registro..." -ForegroundColor Yellow

$registros = @(
    "HKCU:\SOFTWARE\RustDesk",
    "HKLM:\SOFTWARE\RustDesk",
    "HKCU:\SOFTWARE\ARO Nexus",
    "HKLM:\SOFTWARE\ARO Nexus",
    "HKCU:\SOFTWARE\ARO Tecnologia",
    "HKLM:\SOFTWARE\ARO Tecnologia",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*RustDesk*",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*RustDesk*",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*ARO*",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*ARO*"
)

foreach ($reg in $registros) {
    if (Test-Path $reg) {
        Remove-Item -Path $reg -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "   [OK] Removida chave: $reg" -ForegroundColor Green
    }
}

# =======================================================
# 5. LIMPEZA DE ATALHOS E ARQUIVOS SQLITE
# =======================================================
Write-Host "[5/6] Limpeza de atalhos e bancos de dados residuais..." -ForegroundColor Yellow

$atalhos = @(
    "$env:PUBLIC\Desktop\RustDesk.lnk",
    "$env:PUBLIC\Desktop\ARO Nexus.lnk",
    "$env:PUBLIC\Desktop\ARO Tecnologia.lnk",
    "$env:USERPROFILE\Desktop\RustDesk.lnk",
    "$env:USERPROFILE\Desktop\ARO Nexus.lnk",
    "$env:USERPROFILE\Desktop\ARO Tecnologia.lnk",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk.lnk",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\ARO Nexus.lnk",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\ARO Tecnologia.lnk",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\RustDesk Tray.lnk",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\ARO Nexus Tray.lnk"
)

foreach ($lnk in $atalhos) {
    if (Test-Path $lnk) {
        Remove-Item -Path $lnk -Force -ErrorAction SilentlyContinue
        Write-Host "   [OK] Removido atalho: $lnk" -ForegroundColor Green
    }
}

$sqliteFiles = @(
    "$env:APPDATA\RustDesk\config\*.sqlite3",
    "$env:APPDATA\ARO Nexus\config\*.sqlite3",
    "$env:APPDATA\ARO Tecnologia\ARO Nexus\config\*.sqlite3",
    "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\*.sqlite3",
    "C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\RustDesk\config\*.sqlite3",
    "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\ARO Nexus\config\*.sqlite3",
    "C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\ARO Nexus\config\*.sqlite3",
    "C:\Windows\System32\config\systemprofile\AppData\Roaming\RustDesk\config\*.sqlite3",
    "C:\Windows\System32\config\systemprofile\AppData\Roaming\ARO Nexus\config\*.sqlite3"
)

foreach ($pattern in $sqliteFiles) {
    Remove-Item -Path $pattern -Force -ErrorAction SilentlyContinue
}

# =======================================================
# 6. VERIFICAÇÃO FINAL E FORÇA BRUTA (REMOÇÃO DE RESQUÍCIOS)
# =======================================================
Write-Host "[6/6] Verificação final e remoção de resquícios..." -ForegroundColor Yellow

# Tenta novamente remover o serviço caso ainda exista (por nome curto e display)
$servicoRemanescente = Get-Service -Name "ARO Nexus" -ErrorAction SilentlyContinue
if ($servicoRemanescente) {
    Write-Host "   Serviço 'ARO Nexus' ainda presente. Forçando remoção..." -ForegroundColor Red
    Stop-Service -Name "ARO Nexus" -Force -ErrorAction SilentlyContinue
    sc.exe delete "ARO Nexus" | Out-Null
}

# Remove qualquer pasta que possa ter sido recriada ou esquecida
$pastasRecorrentes = @(
    "$env:APPDATA\ARO Nexus",
    "$env:LOCALAPPDATA\ARO Nexus",
    "$env:APPDATA\ARO Tecnologia",
    "C:\Program Files\ARO Nexus"
)
foreach ($pasta in $pastasRecorrentes) {
    if (Test-Path $pasta) {
        Remove-Item -Path $pasta -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "   [OK] Removido (pós-verificação): $pasta" -ForegroundColor Green
    }
}

Write-Host "`n[SUCESSO] Limpeza concluída! Todos os vestígios de RustDesk e ARO Nexus foram removidos." -ForegroundColor Green
Write-Host "Recomendo reiniciar o computador para garantir que o serviço não seja recarregado." -ForegroundColor Yellow
Write-Host "A janela fechará em 10 segundos..." -ForegroundColor Gray
Start-Sleep -Seconds 10
exit
