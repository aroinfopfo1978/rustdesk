# Roadmap (ARO Nexus)

Data de criação: 2026-05-04 23:45:44

## Curto prazo (próximos passos)

- Branding completo (Flutter UI)
  - Revisar telas principais (desktop e mobile) para remover “RustDesk” como marca da interface, mantendo apenas em “créditos/atribuição”.
  - Padronizar rodapé/“About” com: ARO Nexus (produto) + ARO Tecnologia (empresa) + link de crédito ao RustDesk.
  - Consolidar paleta ARO (cor primária/acentos) nos componentes mais visíveis (home, settings, título/toolbar).

- Identidade visual (assets)
  - Garantir que `imgs/aronexus/` contenha os arquivos oficiais (png/jpg/svg/ico) e que estejam incluídos no repositório quando apropriado.
  - Substituir os assets antigos usados pela UI (`flutter/assets/logo.*` e `flutter/assets/icon.*`) pelos assets oficiais do ARO Nexus.
  - Atualizar ícones mobile (Android/iOS) e desktop (Windows/macOS/Linux) via pipeline de geração (ex.: `flutter_launcher_icons`) a partir dos assets finais.

- Build e validação (local + CI)
  - Rodar `flutter analyze` e `flutter build windows` localmente para validar o SDK atual.
  - Reexecutar GitHub Actions e confirmar artifact baixável e executável com nome/marca ARO Nexus.

## Médio prazo

- Distribuição e atualização
  - Definir URL oficial de download do ARO Nexus (onde os clientes baixarão).
  - Ajustar botões e fluxos de “Download/Update/Changelog” para apontar para o endpoint oficial (sem depender de links do RustDesk).
  - Padronizar nome do artifact (ex.: `ARO-Nexus-windows-x64.zip`) e os nomes internos (`ProductName`, `FileDescription`, etc.).

- Instalador/assinatura
  - Ajustar strings do instalador (Windows) para ARO Nexus.
  - Definir estratégia de assinatura (quando aplicável) e alinhar com a distribuição.

## Longo prazo

- Estratégia multi-brand (se necessário)
  - Parametrizar builds por “marca” (assets/strings/config) para gerar variantes sem duplicar código.

- Operação e governança
  - Processo de release (tag + release notes + changelog).
  - Rotina para manter o fork atualizado com upstream, preservando branding e configurações.
