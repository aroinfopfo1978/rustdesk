# Histórico do Projeto (ARO Nexus)

Criado em: 2026-05-04 23:45:44

Este histórico registra as decisões e alterações realizadas no fork do RustDesk para criar o cliente “ARO Nexus” (empresa: ARO Tecnologia), incluindo correções de build/CI e rebranding. Referências e créditos ao projeto RustDesk são mantidos por exigência de licença e atribuição.

## 2026-05-04 (horário não registrado na sessão anterior)

- Diagnóstico de Git/branch:
  - Branch principal confirmada como `master` (não `main`), evitando comandos/refs inválidos como `origin/main`.
  - Situações de push rejeitado por estar atrás do `origin/master` foram tratadas via pull/rebase.
- Submódulo e higiene do repositório:
  - Identificação de submódulo `libs/hbb_common` com conteúdo modificado localmente (estado “sujo”), com orientação para reset/forçar atualização do submódulo antes de seguir.
- Configuração padrão do servidor self-host (sem depender de submódulo):
  - Implementação de defaults no cliente para apontar para o servidor da ARO Tecnologia:
    - ID/Rendezvous: `bdesk.arotecnologia.inf.br`
    - Relay: `bdesk.arotecnologia.inf.br`
    - Key: chave pública do servidor (configurada no cliente)
  - Decisão técnica: aplicar defaults via código no cliente (Rust) para reduzir impacto de mudanças em submódulos e facilitar manutenção.
- GitHub Actions (Flutter/Windows) e geração de artifacts:
  - Correção do `pubspec.yaml` (nome do pacote) para manter compatibilidade com imports internos (`package:flutter_hbb/...`).
  - Ajuste de workflow para garantir upload de artifact em eventos de `push` (evitar build “OK” sem artefato).
  - Redução de builds duplicados em cascata no push.
- Problemas encontrados (e encaminhamento):
  - Patch corrompido (“corrupt patch”) ao tentar aplicar alterações via patch, levando à migração para edições diretas.
  - Ambiente Windows sem Python disponível em algumas tentativas (impacto em scripts auxiliares).
  - Dificuldade em baixar logs de Actions via CLI (HTTP 403 / permissões), exigindo token/autorização adequados.

## 2026-05-04 23:45:44

- Rebranding em andamento para “ARO Nexus” (cliente):
  - Ajustes de textos e links da UI Flutter para apontar para `https://www.arotecnologia.inf.br/`, removendo links de download/marketing do RustDesk onde eram parte da interface.
  - Manutenção explícita de créditos ao RustDesk na seção “Sobre” e/ou rodapé (“RustDesk”) para atribuição.
- Branding no Windows (executável/tray/runner Flutter):
  - Atualização de ícones `.ico` usados pelo cliente/tray e pelo runner do Flutter:
    - `res/icon.ico`, `res/tray-icon.ico`
    - `flutter/windows/runner/resources/icon.ico`, `flutter/windows/runner/resources/app_icon.ico`
  - Metadados do executável no Windows atualizados para “ARO Nexus” / “ARO Tecnologia” (ex.: `Runner.rc`).
  - Nome de janela ajustado no runner (`main.cpp`) para refletir “ARO Nexus”.
- Ajustes para compilar com SDK Flutter atual:
  - Correção de tipos do tema (Flutter): substituição de `DialogTheme`/`TabBarTheme` por `DialogThemeData`/`TabBarThemeData`.
  - Correção de tipo nulo em restauração de posição de janela (String? para String) ao carregar posição salva.
- Identidade visual dentro da UI Flutter (fallback sem assets prontos):
  - Logo/ícone exibidos dentro da UI foram alterados para renderização por texto (sem usar `assets/logo.png` e `assets/icon.png`) para evitar exibição de imagens antigas enquanto os assets oficiais do ARO Nexus (png/svg) não estiverem disponíveis no repositório.

