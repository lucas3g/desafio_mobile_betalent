# BeTalent Mobile Challenge

Este projeto é uma aplicação Flutter desenvolvida como parte do desafio mobile da BeTalent. A aplicação utiliza o json_rest_server para simular um backend e possui configurações específicas para execução em ambiente desktop e mobile. O projeto foi desenvolvido seguindo os princípios de Clean Architecture para garantir uma estrutura escalável, testável e de fácil manutenção.

## 📋 Sobre o Projeto

### Arquitetura e Padrões

O projeto foi estruturado utilizando:
- Clean Architecture para separação de responsabilidades e independência de frameworks
- BLoC (Business Logic Component) como gerenciador de estado
- Get_It para injeção de dependências
- Princípios SOLID
- Repository Pattern para abstração de fonte de dados
- Service Pattern para regras de negócio
- Design Patterns para solução de problemas comuns de desenvolvimento

### Tecnologias Principais
- Flutter versão 3.24.5
- json_rest_server para backend
- Configurações de ambiente (.env) para desktop e mobile
- BLoC para gerenciamento de estado
- Get_It para injeção de dependências

## 🔧 Pré-requisitos

Antes de começar, você precisará ter instalado em sua máquina:

- Flutter (versão 3.24.5)
- Dart SDK
- json_rest_server
- Git

## 🚀 Instruções de Uso

### 1. Clonando o Repositório

```bash
git clone [https://github.com/lucas3g/desafio_mobile_betalent.git]
cd [desafio_mobile_betalent]
```

### 2. Instalando Dependências

```bash
flutter pub get
```

### 3. Configurando o Servidor

Primeiro, instale o json_rest_server globalmente:

```bash
dart pub global activate json_rest_server
```

Para iniciar o servidor:

```bash
json_rest_server run
```

### 4. Configurando o Ambiente

O projeto possui dois arquivos de configuração de ambiente:

- `pc.env`: Para execução em desktop
- `mobile.env`: Para execução em smartphone

#### Configurando para Mobile

1. Abra o arquivo `mobile.env`
2. Altere o IP para o IP da sua máquina:
```env
BASE_URL=http://[SEU_IP]:8080
```

Para descobrir seu IP:
- Windows: `ipconfig`
- Linux/Mac: `ifconfig` ou `ip addr`

### 5. Configurando o VSCode (Recomendado)

Para facilitar o desenvolvimento, você pode configurar o VSCode para executar o projeto com diferentes configurações de ambiente. Crie ou atualize o arquivo `.vscode/launch.json` com o seguinte conteúdo:

```json
{
  "version": "0.2.0",
  "configurations": [
      {
          "name": "[pc] desafio_mobile_betalent",
          "request": "launch",
          "type": "dart",
          "toolArgs": [
              "--dart-define-from-file",
              "pc.env",
          ]
      },
      {
          "name": "[mobile] desafio_mobile_betalent",
          "request": "launch",
          "type": "dart",
          "toolArgs": [
              "--dart-define-from-file",
              "mobile.env",
          ]
      },
  ]
}
```

Com esta configuração, você poderá facilmente alternar entre as configurações de PC e mobile diretamente no VSCode.

### 6. Executando o Projeto

Para Desktop:
```bash
flutter run --dart-define-from-file=pc.env
```

Para Mobile:
```bash
flutter run --dart-define-from-file=mobile.env
```

### 7. Executando os Testes

Para rodar os testes do projeto:

```bash
flutter test
```

## 🔍 Estrutura do Projeto

```
[desafio_mobile_betalent]/
├── lib/
├── test/
├── pc.env
├── mobile.env
└── README.md
```

## 📝 Notas Adicionais

- Certifique-se de que o json_rest_server está rodando antes de iniciar a aplicação
- Verifique se está usando a versão correta do Flutter (3.24.5)
- Em caso de problemas com a conexão, verifique se o IP no arquivo mobile.env está correto
- Usei a fonte "Arimo" do google_fonts que é a mais se a semelha a Helvética (by carinha do grupo StackOverflow).

## 📱 Versão

1.0.0

## ✨ Autor

Lucas Emanuel Silva - [lucassilva080397@gmail.com]

