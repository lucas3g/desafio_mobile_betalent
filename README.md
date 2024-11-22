# BeTalent Mobile Challenge

Este projeto é uma aplicação Flutter desenvolvida como parte do desafio mobile da BeTalent. A aplicação utiliza o json_rest_server para simular um backend e possui configurações específicas para execução em ambiente desktop e mobile.

## 📋 Sobre o Projeto

O projeto foi desenvolvido utilizando:
- Flutter versão 3.24.5
- json_rest_server para backend
- Configurações de ambiente (.env) para desktop e mobile

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

### 5. Executando o Projeto

Para Desktop:
```bash
flutter run --dart-define-from-file=pc.env
```

Para Mobile:
```bash
flutter run --dart-define-from-file=mobile.env
```

### 6. Executando os Testes

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

## 📱 Versão

1.0.0

## ✨ Autor

Lucas Emanuel Silva - [lucassilva080397@gmail.com]

