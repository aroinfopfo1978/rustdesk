<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARO Nexus | Portal Interativo Corporativo</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">

    <!-- Chosen Palette: Corporate Slate & ARO Orange Accent -->
    <!-- Application Structure Plan: The SPA is structured as a modern sidebar dashboard. This architecture was chosen because the source material serves two distinct purposes: Commercial Presentation (Metrics, Value Proposition) and Technical Documentation (Build instructions, Dependencies). A tabbed dashboard allows users (both clients and developers) to navigate directly to their area of interest without scrolling through a massive linear document. Key interactions include navigation state management, interactive data visualizations (Chart.js), and a tabbed interface for code compilation instructions. -->
    <!-- Visualization & Content Choices: 
         1. Goal: Inform (Company Metrics) -> Method: KPI Cards -> Interaction: Hover effects -> Justification: Quick scanning of high-level value.
         2. Goal: Compare (Support Efficiency) -> Method: Chart.js Doughnut Chart -> Interaction: Tooltips/Hover -> Justification: Visually demonstrates the efficiency of remote vs. on-site support, reinforcing the ARO Nexus value proposition.
         3. Goal: Change (Downtime Reduction) -> Method: Chart.js Bar Chart -> Interaction: Tooltips -> Justification: Clearly shows the impact of ARO's NOC monitoring over time.
         4. Goal: Organize (Build Steps) -> Method: Interactive Tabs -> Interaction: Click to switch OS -> Justification: Prevents technical clutter, allowing developers to see only the instructions relevant to their operating system.
         Libraries: Chart.js (Canvas). NO SVG/Mermaid used.
    -->
    <!-- CONFIRMATION: NO SVG graphics used. NO Mermaid JS used. -->

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        heading: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        aro: {
                            orange: '#f26522',
                            dark: '#1e293b', /* Slate 800 */
                            light: '#f8fafc',
                            gray: '#475569'
                        }
                    }
                }
            }
        }
    </script>

    <style>
        /* Base styles and Typography */
        body { background-color: #f8fafc; color: #334155; }
        
        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: #f1f5f9; }
        ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }

        /* Mandatory Chart Container Constraints */
        .chart-container {
            position: relative;
            width: 100%;
            max-width: 100% !important; /* Forces constraint within grid/flex parent */
            margin-left: auto;
            margin-right: auto;
            height: 300px; 
            max-height: 350px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        @media (min-width: 768px) {
            .chart-container { height: 350px; }
        }

        /* Utilities */
        .hidden-section { display: none; }
        .active-section { display: block; animation: fadeIn 0.5s ease-in-out; }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Nav Item Styles */
        .nav-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            margin-bottom: 0.5rem;
            border-radius: 0.5rem;
            color: #94a3b8;
            cursor: pointer;
            transition: all 0.2s;
        }
        .nav-item:hover { background-color: #334155; color: #f8fafc; }
        .nav-item.active {
            background-color: #f26522;
            color: #ffffff;
            font-weight: 600;
        }

        /* CSS Shapes & Unicode for Icons (NO SVG) */
        .icon { font-size: 1.25rem; margin-right: 0.75rem; width: 24px; text-align: center; }
        .dot { height: 8px; width: 8px; background-color: #10b981; border-radius: 50%; display: inline-block; margin-right: 6px; }
    </style>
</head>
<body class="flex h-screen overflow-hidden">

    <!-- Sidebar Navigation -->
    <nav class="w-64 bg-aro-dark flex flex-col h-full shadow-2xl z-20 shrink-0 hidden md:flex">
        <!-- Text Logo (No SVG) -->
        <div class="h-20 flex items-center px-6 border-b border-slate-700">
            <div class="font-heading font-black text-2xl text-white tracking-tight">
                <span class="text-aro-orange">ARO</span> NEXUS
            </div>
        </div>

        <div class="p-4 flex-1 overflow-y-auto">
            <div class="text-xs font-bold text-slate-500 uppercase tracking-widest mb-4 mt-2">Visão Geral</div>
            <div class="nav-item active" onclick="switchSection('dashboard', this)">
                <span class="icon">&#x1F4C8;</span> <!-- Chart Trending Up -->
                Dashboard ARO
            </div>
            <div class="nav-item" onclick="switchSection('solucoes', this)">
                <span class="icon">&#x1F6E1;</span> <!-- Shield -->
                Soluções & NOC
            </div>

            <div class="text-xs font-bold text-slate-500 uppercase tracking-widest mb-4 mt-8">Tecnologia (RustDesk)</div>
            <div class="nav-item" onclick="switchSection('nexus', this)">
                <span class="icon">&#x1F4BB;</span> <!-- Laptop -->
                O ARO Nexus
            </div>
            <div class="nav-item" onclick="switchSection('build', this)">
                <span class="icon">&#x2699;</span> <!-- Gear -->
                Guia de Compilação
            </div>
        </div>

        <div class="p-4 border-t border-slate-700">
            <div class="flex items-center text-sm text-slate-400">
                <span class="dot"></span> Sistema Online
            </div>
        </div>
    </nav>

    <!-- Main Content Area -->
    <main class="flex-1 h-full overflow-y-auto bg-slate-50 relative" id="main-scroll-area">
        
        <!-- Mobile Header -->
        <div class="md:hidden bg-aro-dark h-16 flex items-center justify-between px-4 sticky top-0 z-30 shadow-md">
            <div class="font-heading font-black text-xl text-white">
                <span class="text-aro-orange">ARO</span> NEXUS
            </div>
            <select class="bg-slate-700 text-white border-none rounded p-2 text-sm outline-none" onchange="switchSection(this.value, null)">
                <option value="dashboard">Dashboard ARO</option>
                <option value="solucoes">Soluções & NOC</option>
                <option value="nexus">O ARO Nexus</option>
                <option value="build">Guia de Compilação</option>
            </select>
        </div>

        <div class="p-6 md:p-10 max-w-6xl mx-auto">

            <!-- SECTION: DASHBOARD (Overview & Metrics) -->
            <section id="dashboard" class="active-section pb-20">
                <header class="mb-10">
                    <h1 class="text-3xl md:text-4xl font-heading font-bold text-slate-800 mb-2">Visão Estratégica de TI</h1>
                    <p class="text-slate-500 text-lg">Impacto da gestão ativa de redes e suporte remoto de alta performance.</p>
                </header>

                <!-- Context Paragraph -->
                <div class="bg-white p-6 rounded-xl border border-slate-200 shadow-sm mb-10 text-slate-600 leading-relaxed">
                    <p><strong>Contexto:</strong> Esta seção resume o impacto das operações da ARO Tecnologia. A tecnologia deixou de ser apenas suporte para se tornar o coração do negócio. Os dados abaixo ilustram como nossa infraestrutura (NOC) e ferramentas de acesso remoto (ARO Nexus) reduzem drasticamente o tempo de inatividade (downtime) e otimizam a resolução de incidentes críticos.</p>
                </div>

                <!-- KPI Cards -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                    <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:border-aro-orange transition duration-300">
                        <div class="text-sm font-semibold text-slate-400 uppercase tracking-wide mb-1">Experiência ARO</div>
                        <div class="text-4xl font-heading font-black text-aro-dark mb-2">19 Anos</div>
                        <div class="text-sm text-slate-500">Operações Críticas (Desde 2007)</div>
                    </div>
                    <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:border-aro-orange transition duration-300">
                        <div class="text-sm font-semibold text-slate-400 uppercase tracking-wide mb-1">Resolução Remota</div>
                        <div class="text-4xl font-heading font-black text-aro-dark mb-2">85%</div>
                        <div class="text-sm text-slate-500">Solucionados via ARO Nexus</div>
                    </div>
                    <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:border-aro-orange transition duration-300">
                        <div class="text-sm font-semibold text-slate-400 uppercase tracking-wide mb-1">Segurança de Borda</div>
                        <div class="text-4xl font-heading font-black text-aro-dark mb-2">100%</div>
                        <div class="text-sm text-slate-500">Clientes com NOC Ativo</div>
                    </div>
                </div>

                <!-- Charts Layout -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <!-- Chart 1: Downtime Reduction -->
                    <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex flex-col">
                        <h3 class="text-lg font-bold text-slate-800 mb-1">Redução de Downtime</h3>
                        <p class="text-xs text-slate-500 mb-6">Impacto do Monitoramento Ativo (NOC) vs Gestão Reativa em horas paradas por ano.</p>
                        <!-- REQUIRED CHART CONTAINER -->
                        <div class="chart-container flex-1 w-full">
                            <canvas id="downtimeChart"></canvas>
                        </div>
                    </div>

                    <!-- Chart 2: Resolution Type -->
                    <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex flex-col">
                        <h3 class="text-lg font-bold text-slate-800 mb-1">Eficiência de Suporte</h3>
                        <p class="text-xs text-slate-500 mb-6">Distribuição de resoluções de chamados utilizando a plataforma ARO Nexus.</p>
                        <!-- REQUIRED CHART CONTAINER -->
                        <div class="chart-container flex-1 w-full">
                            <canvas id="resolutionChart"></canvas>
                        </div>
                    </div>
                </div>
            </section>

            <!-- SECTION: SOLUÇÕES & NOC -->
            <section id="solucoes" class="hidden-section pb-20">
                <header class="mb-10">
                    <h1 class="text-3xl md:text-4xl font-heading font-bold text-slate-800 mb-2">TI de Alta Performance</h1>
                    <p class="text-slate-500 text-lg">Os pilares da blindagem operacional corporativa.</p>
                </header>

                <div class="bg-white p-6 rounded-xl border border-slate-200 shadow-sm mb-10 text-slate-600 leading-relaxed">
                    <p><strong>Contexto:</strong> Detalhamento da metodologia de trabalho e serviços da ARO Tecnologia. Estas soluções formam a base do contrato de suporte mensal, garantindo que as empresas eliminem o cenário de "apaga incêndios" através de infraestrutura robusta, segurança de dados rigorosa e monitoramento proativo.</p>
                </div>

                <!-- Solutions Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="bg-white p-8 rounded-2xl border-t-4 border-aro-orange shadow-md">
                        <div class="text-3xl mb-4">&#x1F5A7;</div> <!-- Desktop Network -->
                        <h3 class="text-xl font-heading font-bold text-slate-800 mb-3">1. Infra e Redes</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">Redes Gigabit e Wi-Fi Profissional sem áreas de sombra. Gestão de tráfego avançada com roteadores corporativos multi-WAN, garantindo prioridade total para seu ERP e emissão de Notas Fiscais.</p>
                    </div>

                    <div class="bg-white p-8 rounded-2xl border-t-4 border-slate-800 shadow-md">
                        <div class="text-3xl mb-4">&#x1F512;</div> <!-- Lock -->
                        <h3 class="text-xl font-heading font-bold text-slate-800 mb-3">2. Segurança Blindada</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">Implantação de Firewalls e VPNs corporativas para trabalho remoto seguro. Controle rigoroso de acessos e rotinas de backup à prova de falhas contra ataques de Ransomware.</p>
                    </div>

                    <div class="bg-white p-8 rounded-2xl border-t-4 border-slate-800 shadow-md">
                        <div class="text-3xl mb-4">&#x1F4CA;</div> <!-- Bar Chart -->
                        <h3 class="text-xl font-heading font-bold text-slate-800 mb-3">3. Monitoramento Ativo (NOC)</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">Visibilidade total do seu negócio. Monitoramento em tempo real da saúde dos seus links de internet, servidores e ativos críticos de rede. Fim do "Apaga Incêndios".</p>
                    </div>

                    <div class="bg-white p-8 rounded-2xl border-t-4 border-aro-orange shadow-md">
                        <div class="text-3xl mb-4">&#x1F4E2;</div> <!-- Inbox/Support -->
                        <h3 class="text-xl font-heading font-bold text-slate-800 mb-3">4. Suporte Híbrido</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">Help Desk remoto imediato (via ARO Nexus) para destravar o trabalho da sua equipe com agilidade, além de manutenções presenciais estratégicas atuando diretamente no hardware.</p>
                    </div>
                </div>
            </section>

            <!-- SECTION: ARO NEXUS (Product Details) -->
            <section id="nexus" class="hidden-section pb-20">
                <header class="mb-10">
                    <h1 class="text-3xl md:text-4xl font-heading font-bold text-slate-800 mb-2">O ARO Nexus</h1>
                    <p class="text-slate-500 text-lg">Custom Fork Enterprise construído sobre RustDesk.</p>
                </header>

                <div class="bg-white p-6 rounded-xl border border-slate-200 shadow-sm mb-10 text-slate-600 leading-relaxed">
                    <p><strong>Contexto:</strong> Esta seção detalha o software proprietário <b>ARO Nexus</b>. Baseado no núcleo open-source do RustDesk, a aplicação foi pesonalizada para oferecer acesso remoto direto e seguro, roteado através de infraestrutura própria da ARO. Isso elimina a dependência de servidores de terceiros, garantindo adequação à LGPD e segurança de ponta a ponta (End-to-End Encryption).</p>
                </div>

                <div class="bg-slate-900 text-white rounded-2xl p-8 md:p-12 shadow-xl mb-10 relative overflow-hidden">
                    <div class="absolute top-0 right-0 p-8 text-9xl opacity-5">&#x1F5A5;</div> <!-- Giant faint monitor -->
                    <h2 class="text-2xl font-heading font-bold text-aro-orange mb-4">A Solução Definitiva de Suporte Remoto</h2>
                    <p class="text-slate-300 mb-8 max-w-3xl leading-relaxed">O ARO Nexus foi projetado para operar sem a necessidade de configurações complexas de firewall por parte do cliente final. Todo o tráfego é roteado através de servidores Rendezvous/Relay privados da ARO Tecnologia.</p>
                    
                    <ul class="space-y-4">
                        <li class="flex items-start">
                            <span class="text-aro-orange mr-3">&#x2714;</span> <!-- Check mark -->
                            <span><strong>Interface Customizada (Corporate High-Tech):</strong> Identidade visual focada em usabilidade e estética de servidores (Dark Theme).</span>
                        </li>
                        <li class="flex items-start">
                            <span class="text-aro-orange mr-3">&#x2714;</span>
                            <span><strong>Segurança Máxima:</strong> Controle total dos dados, sem preocupações com invasões de privacidade ou interceptação corporativa.</span>
                        </li>
                        <li class="flex items-start">
                            <span class="text-aro-orange mr-3">&#x2714;</span>
                            <span><strong>Integração NOC:</strong> Preparado para trabalhar em conjunto com nossa infraestrutura de monitoramento ativo (BetterDesk).</span>
                        </li>
                    </ul>
                </div>

                <h3 class="text-xl font-bold text-slate-800 mb-4">Estrutura Interna (Repositório)</h3>
                <div class="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
                    <table class="w-full text-left text-sm text-slate-600">
                        <thead class="bg-slate-50 border-b border-slate-200">
                            <tr>
                                <th class="px-6 py-4 font-bold text-slate-800">Diretório / Módulo</th>
                                <th class="px-6 py-4 font-bold text-slate-800">Função Principal</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <tr class="hover:bg-slate-50">
                                <td class="px-6 py-4 font-mono font-semibold text-aro-dark">libs/hbb_common</td>
                                <td class="px-6 py-4">Codec de vídeo, TCP/UDP wrapper, transferência de arquivos (fs).</td>
                            </tr>
                            <tr class="hover:bg-slate-50">
                                <td class="px-6 py-4 font-mono font-semibold text-aro-dark">libs/scrap</td>
                                <td class="px-6 py-4">Motor principal de captura de tela de alta performance.</td>
                            </tr>
                            <tr class="hover:bg-slate-50">
                                <td class="px-6 py-4 font-mono font-semibold text-aro-dark">libs/enigo</td>
                                <td class="px-6 py-4">Controle de hardware (teclado/mouse) específico por SO.</td>
                            </tr>
                            <tr class="hover:bg-slate-50">
                                <td class="px-6 py-4 font-mono font-semibold text-aro-dark">src/rendezvous_mediator.rs</td>
                                <td class="px-6 py-4">Comunicação P2P, TCP hole punching e Relay com o Servidor ARO.</td>
                            </tr>
                            <tr class="hover:bg-slate-50">
                                <td class="px-6 py-4 font-mono font-semibold text-aro-dark">flutter/</td>
                                <td class="px-6 py-4"><span class="bg-orange-100 text-aro-orange px-2 py-1 rounded text-xs font-bold mr-2">CORE UI</span> Código fonte da GUI Desktop/Mobile com customização de marca.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- SECTION: BUILD GUIDE (Documentation) -->
            <section id="build" class="hidden-section pb-20">
                <header class="mb-10">
                    <h1 class="text-3xl md:text-4xl font-heading font-bold text-slate-800 mb-2">Guia de Compilação (Build)</h1>
                    <p class="text-slate-500 text-lg">Documentação técnica para gerar o executável do ARO Nexus.</p>
                </header>

                <div class="bg-white p-6 rounded-xl border border-slate-200 shadow-sm mb-10 text-slate-600 leading-relaxed">
                    <p><strong>Contexto:</strong> Área restrita a desenvolvedores. Contém as instruções extraídas do <code>README.md</code> do repositório para compilar o código fonte em Rust e Flutter. O uso de abas interativas permite que o engenheiro filtre os comandos exatos para a sua infraestrutura, evitando poluição visual.</p>
                </div>

                <!-- Interactive Tabs -->
                <div class="mb-6 flex border-b border-slate-200">
                    <button class="px-6 py-3 font-semibold text-aro-orange border-b-2 border-aro-orange outline-none bg-white rounded-t-lg" id="tab-docker" onclick="switchBuildTab('docker', this)">
                        &#x1F433; Docker (Recomendado)
                    </button>
                    <button class="px-6 py-3 font-medium text-slate-500 border-b-2 border-transparent hover:text-slate-800 outline-none transition" id="tab-linux" onclick="switchBuildTab('linux', this)">
                        &#x1F427; Linux (Ubuntu/Debian)
                    </button>
                </div>

                <!-- Tab Content: Docker -->
                <div id="content-docker" class="bg-slate-900 rounded-xl p-6 md:p-8 shadow-inner border border-slate-700">
                    <h3 class="text-white font-bold mb-4">1. Construir o Container</h3>
                    <p class="text-slate-400 text-sm mb-2">Clone o repositório e crie a imagem base de compilação:</p>
                    <div class="bg-black p-4 rounded-md font-mono text-sm text-green-400 mb-8 overflow-x-auto">
                        git clone URL_DO_SEU_REPOSITORIO_ARO_NEXUS<br>
                        cd aro-nexus<br>
                        git submodule update --init --recursive<br>
                        docker build -t "aronexus-builder" .
                    </div>

                    <h3 class="text-white font-bold mb-4">2. Compilar Aplicação</h3>
                    <p class="text-slate-400 text-sm mb-2">Gere a versão final (Release). O executável estará em <code>target/release/</code>:</p>
                    <div class="bg-black p-4 rounded-md font-mono text-sm text-green-400 overflow-x-auto relative">
                        docker run --rm -it -v $PWD:/home/user/rustdesk -v rustdesk-git-cache:/home/user/.cargo/git -v rustdesk-registry-cache:/home/user/.cargo/registry -e PUID="$(id -u)" -e PGID="$(id -g)" aronexus-builder --release
                    </div>
                </div>

                <!-- Tab Content: Linux -->
                <div id="content-linux" class="hidden-section bg-slate-900 rounded-xl p-6 md:p-8 shadow-inner border border-slate-700">
                    <h3 class="text-white font-bold mb-4">1. Dependências e vcpkg</h3>
                    <div class="bg-black p-4 rounded-md font-mono text-sm text-blue-300 mb-6 overflow-x-auto">
                        sudo apt install -y zip g++ gcc git curl wget nasm yasm libgtk-3-dev clang libxcb-randr0-dev libxdo-dev libxfixes-dev libxcb-shape0-dev libxcb-xfixes0-dev libasound2-dev libpulse-dev cmake make libclang-dev ninja-build libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libpam0g-dev<br><br>
                        git clone https://github.com/microsoft/vcpkg<br>
                        cd vcpkg && git checkout 2023.04.15 && cd ..<br>
                        vcpkg/bootstrap-vcpkg.sh<br>
                        export VCPKG_ROOT=$HOME/vcpkg<br>
                        vcpkg/vcpkg install libvpx libyuv opus aom
                    </div>

                    <h3 class="text-white font-bold mb-4">2. Compilação Local (Rust Core)</h3>
                    <div class="bg-black p-4 rounded-md font-mono text-sm text-blue-300 overflow-x-auto">
                        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh<br>
                        source $HOME/.cargo/env<br>
                        git clone --recurse-submodules URL_DO_SEU_REPOSITORIO_ARO_NEXUS<br>
                        cd aro-nexus<br>
                        mkdir -p target/debug<br>
                        wget https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so<br>
                        mv libsciter-gtk.so target/debug<br>
                        VCPKG_ROOT=$HOME/vcpkg cargo run
                    </div>
                </div>
            </section>
            
            <!-- Footer -->
            <footer class="mt-10 py-6 border-t border-slate-200 text-center text-sm text-slate-400">
                &copy; 2007 - 2026 ARO Tecnologia. Portal Interativo SPA.
            </footer>

        </div>
    </main>

    <!-- Application Logic -->
    <script>
        // Data for Visualizations (Simulated based on context)
        const chartData = {
            downtime: {
                labels: ['Ano 1', 'Ano 2', 'Ano 3', 'Ano 4'],
                datasets: [
                    {
                        label: 'Gestão Reativa (Horas/Ano)',
                        data: [120, 105, 110, 95],
                        backgroundColor: '#cbd5e1', // Slate 300
                        borderRadius: 4
                    },
                    {
                        label: 'NOC ARO Tecnologia (Horas/Ano)',
                        data: [120, 45, 18, 5],
                        backgroundColor: '#f26522', // ARO Orange
                        borderRadius: 4
                    }
                ]
            },
            resolution: {
                labels: ['Remoto Imediato (ARO Nexus)', 'Visita Presencial', 'Manutenção Hardware'],
                datasets: [{
                    data: [85, 10, 5],
                    backgroundColor: [
                        '#1e293b', // Dark Slate
                        '#f26522', // Orange
                        '#94a3b8'  // Slate 400
                    ],
                    borderWidth: 0,
                    hoverOffset: 4
                }]
            }
        };

        // Navigation State Management
        function switchSection(sectionId, element) {
            // Hide all sections
            document.querySelectorAll('main > div > section').forEach(sec => {
                sec.classList.remove('active-section');
                sec.classList.add('hidden-section');
            });
            
            // Show target section
            document.getElementById(sectionId).classList.remove('hidden-section');
            document.getElementById(sectionId).classList.add('active-section');

            // Scroll to top
            document.getElementById('main-scroll-area').scrollTop = 0;

            // Update Desktop Nav UI
            if (element && element.tagName !== 'SELECT') {
                document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
                element.classList.add('active');
            }
        }

        // Build Tab Switching Logic
        function switchBuildTab(tabId, btnElement) {
            // Hide contents
            document.getElementById('content-docker').classList.add('hidden-section');
            document.getElementById('content-linux').classList.add('hidden-section');
            
            // Show target
            document.getElementById('content-' + tabId).classList.remove('hidden-section');
            
            // Reset Button Styles
            document.getElementById('tab-docker').className = "px-6 py-3 font-medium text-slate-500 border-b-2 border-transparent hover:text-slate-800 outline-none transition";
            document.getElementById('tab-linux').className = "px-6 py-3 font-medium text-slate-500 border-b-2 border-transparent hover:text-slate-800 outline-none transition";
            
            // Set Active Button Style
            btnElement.className = "px-6 py-3 font-semibold text-aro-orange border-b-2 border-aro-orange outline-none bg-white rounded-t-lg";
        }

        // Initialize Chart.js Visualizations
        document.addEventListener('DOMContentLoaded', function() {
            
            // Common Chart Options ensuring responsiveness within constraints
            const commonOptions = {
                responsive: true,
                maintainAspectRatio: false, // Critical for CSS height/width constraints to work
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { font: { family: "'Inter', sans-serif" }, color: '#475569' }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(30, 41, 59, 0.9)',
                        padding: 12,
                        cornerRadius: 8,
                        titleFont: { family: "'Poppins', sans-serif", size: 14 },
                        bodyFont: { family: "'Inter', sans-serif", size: 13 }
                    }
                }
            };

            // 1. Bar Chart (Downtime Comparison)
            const ctxDowntime = document.getElementById('downtimeChart').getContext('2d');
            new Chart(ctxDowntime, {
                type: 'bar',
                data: chartData.downtime,
                options: {
                    ...commonOptions,
                    scales: {
                        y: { 
                            beginAtZero: true,
                            grid: { color: '#f1f5f9' },
                            ticks: { color: '#94a3b8' }
                        },
                        x: {
                            grid: { display: false },
                            ticks: { color: '#64748b' }
                        }
                    }
                }
            });

            // 2. Doughnut Chart (Resolution Efficiency)
            const ctxRes = document.getElementById('resolutionChart').getContext('2d');
            new Chart(ctxRes, {
                type: 'doughnut',
                data: chartData.resolution,
                options: {
                    ...commonOptions,
                    cutout: '70%',
                    plugins: {
                        ...commonOptions.plugins,
                        legend: { position: 'right' } // Better fit for doughnut
                    }
                }
            });
        });
    </script>
</body>
</html>
