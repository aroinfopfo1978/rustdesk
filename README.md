[!NOTE]
Sobre este Projeto: 




Gestão e Suporte Remoto de Alta Performance. O ARO Nexus é um Fork corporativo do RustDesk mantido pela ARO Tecnologia, focado em segurança de dados e monitoramento NOC. Personalizado para atender aos rigorosos padrões de disponibilidade exigidos por nossos clientes corporativos.

A Solução Definitiva de Suporte Remoto

O ARO Nexus foi projetado para operar sem a necessidade de configurações complexas de firewall por parte do cliente final. Ao contrário de soluções comerciais genéricas, todo o tráfego do ARO Nexus é roteado através de servidores Rendezvous/Relay privados da ARO Tecnologia, garantindo controle absoluto dos dados e adequação total à LGPD.

Interface Customizada (Corporate High-Tech): Identidade visual focada em usabilidade e estética de servidores (Dark Theme).

Segurança Máxima: Controle total dos dados, sem preocupações com invasões de privacidade.

Integração NOC: Preparado para trabalhar em conjunto com nossa infraestrutura de monitoramento ativo (BetterDesk).

Dependências para Desenvolvimento

As versões para Desktop utilizam Flutter para a interface gráfica (GUI). Para compilar a aplicação, você precisará configurar o ambiente Rust e as bibliotecas dinâmicas do Sciter (legado) ou Flutter.

Certifique-se de baixar as bibliotecas dinâmicas necessárias para o seu sistema:

Windows |
Linux |
macOS

Como Compilar (Build)

1. Preparação Básica (Windows/Linux/macOS)

Prepare o seu ambiente de desenvolvimento Rust e o ambiente de compilação C++.

Instale o vcpkg e configure a variável de ambiente VCPKG_ROOT corretamente.

Windows: vcpkg install libvpx:x64-windows-static libyuv:x64-windows-static opus:x64-windows-static aom:x64-windows-static

Linux/macOS: vcpkg install libvpx libyuv opus aom

Execute cargo run

2. Compilando no Linux (Ubuntu/Debian)

Instale as dependências essenciais e o vcpkg:

sudo apt install -y zip g++ gcc git curl wget nasm yasm libgtk-3-dev clang libxcb-randr0-dev libxdo-dev libxfixes-dev libxcb-shape0-dev libxcb-xfixes0-dev libasound2-dev libpulse-dev cmake make libclang-dev ninja-build libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libpam0g-dev

git clone [https://github.com/microsoft/vcpkg](https://github.com/microsoft/vcpkg)
cd vcpkg && git checkout 2023.04.15 && cd ..
vcpkg/bootstrap-vcpkg.sh
export VCPKG_ROOT=$HOME/vcpkg
vcpkg/vcpkg install libvpx libyuv opus aom


Compile o projeto (Rust Core):

curl --proto '=https' --tlsv1.2 -sSf [https://sh.rustup.rs](https://sh.rustup.rs) | sh
source $HOME/.cargo/env
git clone --recurse-submodules [https://github.com/aroinfopfo1978/rustdesk](https://github.com/aroinfopfo1978/rustdesk)
cd rustdesk
mkdir -p target/debug
wget [https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so](https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so)
mv libsciter-gtk.so target/debug
VCPKG_ROOT=$HOME/vcpkg cargo run


Como compilar com Docker (Recomendado)

Comece clonando o repositório e construindo o container Docker:

git clone [https://github.com/aroinfopfo1978/rustdesk](https://github.com/aroinfopfo1978/rustdesk)
cd rustdesk
git submodule update --init --recursive
docker build -t "aronexus-builder" .


Em seguida, cada vez que precisar compilar a aplicação, execute:

docker run --rm -it -v $PWD:/home/user/rustdesk -v rustdesk-git-cache:/home/user/.cargo/git -v rustdesk-registry-cache:/home/user/.cargo/registry -e PUID="$(id -u)" -e PGID="$(id -g)" aronexus-builder --release


O executável gerado estará disponível na pasta target/release/ do seu repositório.

Estrutura de Arquivos do Projeto

libs/hbb_common: Codec de vídeo, configurações, wrapper TCP/UDP, transferência de arquivos (fs) e funções utilitárias.

libs/scrap: Motor de captura de tela de alta performance.

libs/enigo: Controle específico por sistema operacional de teclado/mouse.

libs/clipboard: Implementação de copiar e colar para Windows, Linux e macOS.

src/server: Serviços de áudio/área de transferência/input/vídeo e conexões de rede.

src/rendezvous_mediator.rs: Comunicação P2P, TCP hole punching e Relay com o Servidor ARO.

flutter: Código-fonte principal da Interface Gráfica (Desktop e Mobile) - Local onde a personalização visual do ARO Nexus é aplicada.
