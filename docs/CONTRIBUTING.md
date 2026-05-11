Contribuindo com o ARO Nexus

Obrigado por investir seu tempo em contribuir com o ARO Nexus! Como este é um repositório mantido pela ARO Tecnologia focado em uso corporativo interno e distribuição para nossos clientes, temos um fluxo de trabalho específico para garantir a estabilidade e segurança do software.

Relatando Bugs ou Solicitando Funcionalidades

Para reportar um bug ou sugerir uma melhoria, por favor, crie uma Issue neste repositório do GitHub (https://github.com/aroinfopfo1978/rustdesk/issues).

O que incluir em um relatório de bug:

Sistema Operacional (Windows 11, macOS, Ubuntu, etc.) e versão.

Passos claros para reproduzir o problema.

Comportamento esperado vs. comportamento atual.

Capturas de tela (se aplicável, escondendo IDs e Senhas reais).

Processo de Desenvolvimento (Pull Requests)

Se você é um desenvolvedor da equipe ou parceiro convidado, siga o fluxo abaixo:

Crie uma Branch: Nunca faça commits diretos na main. Crie uma branch a partir dela com um nome descritivo (ex: fix/tela-branca-windows ou feat/nova-cor-botoes).

Qualidade do Código: Certifique-se de que seu código segue as convenções do Rust (cargo fmt) e do Dart/Flutter (flutter format).

Não altere o Core de Criptografia: A não ser que seja explicitamente solicitado e validado.

Submeta um Pull Request (PR): Abra um PR apontando para a branch main.

Revisão Técnica: Seu PR passará por uma Code Review pelo Administrador do projeto (Alexandre) antes de ser mesclado (merged) e compilado para a nova versão (Release).

Atualizações do Upstream (RustDesk Original)

Periodicamente, o repositório fará o merge das atualizações de segurança e melhorias do repositório original do RustDesk. Se você estiver trabalhando em uma feature, certifique-se de realizar o rebase ou merge da branch main atualizada antes de abrir seu PR para evitar conflitos de interface gráfica (GUI).
