# Jantar dos Filósofos

Este é um projeto que implementa o clássico problema do Jantar dos Filósofos usando C# e Windows Forms. O projeto simula cinco filósofos (Alan Turing, Ada Lovelace, Filosofo 2, Djikstra e Filosofo 3) que alternam entre os estados de pensando, faminto e comendo.

## 🎯 Funcionalidades

- Interface gráfica com botões representando cada filósofo
- Simulação visual dos estados dos filósofos:
  - Pensando (amarelo)
  - Faminto (vermelho)
  - Comendo (verde)
- Imagens personalizadas para cada filósofo em diferentes estados
- Sistema de threads para simular o comportamento concorrente dos filósofos
- Implementação do algoritmo de prevenção de deadlock

## 🛠️ Tecnologias Utilizadas

- C# (.NET Framework 4.7.2)
- Windows Forms
- Threading
- GDI+ para manipulação de imagens

## 📋 Pré-requisitos

**Para desenvolvimento local (sem Docker):**
- Windows 10 ou superior
- .NET Framework 4.7.2 SDK (ou superior, como o 4.8 SDK). Você pode baixá-lo [aqui](https://dotnet.microsoft.com/download/dotnet-framework).
- MSBuild (geralmente incluído com o .NET Framework SDK ou Visual Studio).
- Visual Studio 2019 ou superior (opcional, mas útil para gerenciamento de dependências e build) OU VS Code com a extensão C# da Microsoft.

**Para desenvolvimento com VS Code Dev Container:**
- Windows 10 ou superior
- Docker Desktop (configurado para usar Windows Containers).
- (O .NET Framework 4.8 SDK é fornecido pelo ambiente de desenvolvimento no container).

## �� Como Executar

### Usando Visual Studio

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/Jantar-dos-Filosofos.git
```

2. Abra o arquivo `Jantar dos Filosofos.sln` no Visual Studio

3. Compile o projeto (F6 ou Build > Build Solution)

4. Execute o projeto (F5 ou Debug > Start Debugging)

### Usando VSCode com Dev Container (Recomendado)

1.  **Certifique-se de que o Docker Desktop está instalado, em execução e configurado para usar 'Windows containers'.**
    *   Você pode verificar isso clicando com o botão direito no ícone do Docker na bandeja do sistema e selecionando "Switch to Windows containers..." (se estiver mostrando "Switch to Linux containers...", você já está no modo Windows).

2.  **Clone o repositório:**
    ```bash
    git clone https://github.com/seu-usuario/Jantar-dos-Filosofos.git
    ```
    *Substitua `seu-usuario` pelo nome de usuário correto, se aplicável.*

3.  **Abra a pasta do projeto no VSCode.**

4.  **Reabrir no Container:**
    *   O VSCode deve detectar automaticamente a configuração do Dev Container (`.devcontainer/devcontainer.json`).
    *   Clique em "**Reopen in Container**" quando solicitado na notificação no canto inferior direito.
    *   Se você não vir a notificação, abra a Paleta de Comandos (`Ctrl+Shift+P` ou `Cmd+Shift+P` no macOS) e procure por "**Remote-Containers: Reopen in Container**".

5.  **Aguarde o Build da Imagem:**
    *   Aguarde o build da imagem Docker e a inicialização do container. Isso pode levar alguns minutos na primeira vez, pois o Docker precisará baixar a imagem base do Windows Server Core e executar os passos de configuração definidos no `Dockerfile`.

6.  **Conectar via RDP (Remote Desktop Protocol):**
    *   Após o container iniciar e o VSCode se conectar a ele, você precisará se conectar à interface gráfica do Windows dentro do container usando um cliente RDP.
    *   Abra o aplicativo "**Conexão de Área de Trabalho Remota**" (Remote Desktop Connection) no seu Windows (geralmente encontrado pesquisando "mstsc" no menu Iniciar).
    *   No campo "Computador", digite: `localhost:3389`
        *   A porta `3389` é encaminhada do container para o seu host conforme definido em `.devcontainer/devcontainer.json`.
    *   Clique em "Conectar".

7.  **Login no Container:**
    *   Quando solicitado o login, use as seguintes credenciais:
        *   Usuário: `ContainerAdministrator`
        *   Senha: `AdminP@ssw0rd!` (esta é a senha configurada no `Dockerfile`)
    *   Você pode ser solicitado a confirmar o certificado do computador remoto; aceite para continuar.

8.  **Dentro da Sessão RDP:**
    *   Você agora está visualizando e controlando o ambiente desktop do Windows Server Core dentro do container.
    *   Abra o **PowerShell** ou o **Prompt de Comando (CMD)**. Você pode encontrá-los no Menu Iniciar dentro da sessão RDP.
    *   Navegue até o diretório de trabalho do projeto:
        ```powershell
        cd C:\app
        ```
        *(Este é o `WORKDIR` definido no `Dockerfile`)*.

9.  **Executar o Projeto:**
    *   O projeto já foi compilado durante o processo de build da imagem Docker (devido ao comando `RUN msbuild ...` no `Dockerfile`).
    *   Para executar a aplicação Windows Forms, navegue até a pasta de saída e execute o arquivo `.exe`. O nome exato do executável pode variar com base no nome do projeto (ex: `JantarDosFilosofosNet.exe`). Assumindo que o nome do projeto é "Jantar dos Filosofos" e o assembly name é "JantarDosFilosofosNet":
        ```powershell
        .\bin\Release\JantarDosFilosofosNet.exe
        ```
        *Verifique o nome correto do arquivo `.exe` na pasta `C:\app\bin\Release` se necessário.*

10. **Recompilar o Projeto (Após Alterações no Código):**
    *   Se você fizer alterações no código-fonte (arquivos `.cs`, `.resx`, etc.) usando o VSCode (que está editando os arquivos dentro do container), você precisará recompilar o projeto.
    *   Você pode fazer isso de duas maneiras:
        *   **No terminal integrado do VSCode** (que já está conectado ao container):
          ```powershell
          msbuild "Jantar dos Filosofos.sln" /p:Configuration=Release
          ```
          *(Certifique-se de estar no diretório `C:\app` no terminal do VSCode).*
        *   **No PowerShell ou CMD dentro da sessão RDP** (no diretório `C:\app`):
          ```powershell
          msbuild "Jantar dos Filosofos.sln" /p:Configuration=Release
          ```
    *   Após a recompilação, execute o aplicativo novamente conforme o passo 9.

O Dev Container executa um ambiente Windows com o .NET Framework necessário, isolando as dependências do projeto.

### Usando VSCode Localmente (Sem Docker)

Se preferir não usar o ambiente de container Docker, você pode configurar e executar o projeto localmente no VSCode seguindo estes passos:

1.  **Instale os Pré-requisitos Locais:**
    *   Certifique-se de ter o [.NET Framework 4.7.2 SDK](https://dotnet.microsoft.com/download/dotnet-framework) (ou uma versão compatível como 4.8) instalado em seu sistema Windows.
    *   Instale o [Visual Studio Code](https://code.visualstudio.com/).
    *   Instale a extensão [C# for Visual Studio Code (powered by OmniSharp)](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp) no VSCode.

2.  **Clone o Repositório:**
    ```bash
    git clone https://github.com/seu-usuario/Jantar-dos-Filosofos.git
    cd Jantar-dos-Filosofos
    ```
    *(Substitua `seu-usuario` pelo nome de usuário correto, se aplicável.)*

3.  **Abra a Pasta no VSCode:**
    ```bash
    code .
    ```

4.  **Compile o Projeto:**
    *   Abra o terminal integrado no VSCode (`Ctrl+\` ou `View > Terminal`).
    *   Use o MSBuild para compilar a solução. Você pode precisar encontrar o caminho para `MSBuild.exe` se ele não estiver no PATH. Caminhos comuns incluem:
        *   `C:\Program Files (x86)\Microsoft Visual Studio\<Ano>\<Edição>\MSBuild\Current\Bin\MSBuild.exe` (Ex: `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe`)
        *   `C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe` (para .NET Framework 4.x)
    *   Exemplo de comando de build (ajuste o caminho do MSBuild conforme necessário):
        ```powershell
        & "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" "Jantar dos Filosofos.sln" /p:Configuration=Release
        ```
    *   Alternativamente, o VSCode com a extensão C# pode oferecer tarefas de build (procure por "Run Build Task" na paleta de comandos `Ctrl+Shift+P`).

5.  **Execute o Projeto:**
    *   Após a compilação bem-sucedida, o executável estará na pasta `bin\Release` (ou `bin\Debug` se compilado em modo Debug).
    *   Execute o arquivo `.exe` diretamente (o nome exato é definido no arquivo `.csproj`, neste caso `JantarDosFilosofosNet.exe`):
        ```powershell
        .\bin\Release\JantarDosFilosofosNet.exe
        ```

> **Nota:** Como este é um projeto Windows Forms, ele precisa ser executado em um ambiente Windows com o .NET Framework correspondente instalado.

## 🎮 Como Usar

1. Ao iniciar o programa, você verá 5 botões representando os filósofos
2. Clique em cada botão para iniciar a thread do respectivo filósofo
3. Observe as mudanças de estado e cores:
   - Amarelo: Filósofo está pensando
   - Vermelho: Filósofo está faminto
   - Verde: Filósofo está comendo

## 📝 Estrutura do Projeto

- `Form1.cs`: Contém a interface gráfica e a lógica de atualização dos estados
- `Program.cs`: Contém a lógica principal do problema dos filósofos
- `Resources/`: Pasta contendo as imagens dos filósofos em diferentes estados

## 🔒 Algoritmo de Prevenção de Deadlock

O projeto implementa uma solução para o problema do deadlock através da seguinte estratégia:
- O último filósofo pega os garfos em ordem inversa
- Uso de locks para garantir exclusão mútua
- Sistema de prioridade para evitar starvation

## 🤝 Contribuindo

1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores

- Seu Nome - Desenvolvimento inicial

## 🙏 Agradecimentos

- Inspirado no clássico problema do Jantar dos Filósofos de Edsger Dijkstra
- Imagens dos filósofos retiradas de fontes públicas 