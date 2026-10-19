# 📝 AppTask Flutter

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Windows%20%7C%20Linux%20%7C%20macOS-blue?style=for-the-badge)

</div>

Um aplicativo moderno e intuitivo para gerenciamento de tarefas pessoais e rotinas, desenvolvido em **Flutter** com suporte a persistência local de dados através do **SQLite** (`sqflite` e `sqflite_common_ffi` para Desktop).

---

## 📌 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Arquitetura e Estrutura de Pastas](#-arquitetura-e-estrutura-de-pastas)
- [Modelagem do Banco de Dados](#-modelagem-do-banco-de-dados)
- [Pré-requisitos e Instalação](#-pré-requisitos-e-instalação)
- [Como Executar](#-como-executar)
- [Próximos Passos e Melhorias](#-próximos-passos-e-melhorias)
- [Licença](#-licença)

---

## 📖 Sobre o Projeto

O **AppTask Flutter** foi concebido para simplificar o acompanhamento de compromissos diários, oferecendo controle de acesso com autenticação de usuário e um painel prático para criar, listar, atualizar e remover tarefas (operações completas de CRUD).

O aplicativo conta com suporte multiplataforma (Mobile e Desktop), permitindo a execução tanto em dispositivos móveis quanto em sistemas operacionais desktop graças à integração do FFI com o SQLite.

---

## ✨ Funcionalidades

- **Splash Screen**: Tela de abertura animada com logotipo e transição automática.
- **Autenticação de Usuário**:
  - Cadastro de nova conta (Nome, E-mail e Senha).
  - Login consultando a base de dados local SQLite.
- **Gerenciamento de Tarefas (CRUD)**:
  - **Criar**: Adição de novas tarefas com título, descrição e agendamento de data/hora.
  - **Listar**: Exibição das tarefas ativas diretamente na tela inicial.
  - **Editar**: Atualização rápida de título, descrição ou data/hora por meio de modal interativo.
  - **Excluir**: Remoção de tarefas de forma intuitiva utilizando ações de arrastar (*slide to delete/edit* com `flutter_slidable`).
- **Navegação & Menus**: Acesso ágil a telas através de `PopupMenuButton` na barra superior.
- **Persistência Offline**: Dados gravados localmente sem necessidade de conexão com a internet.

---

## 🛠️ Tecnologias Utilizadas

- **Framework**: [Flutter](https://flutter.dev/) (SDK `>=3.2.3 <4.0.0`)
- **Linguagem**: [Dart](https://dart.dev/)
- **Persistência Local**:
  - [`sqflite`](https://pub.dev/packages/sqflite) (Mobile)
  - [`sqflite_common_ffi`](https://pub.dev/packages/sqflite_common_ffi) (Desktop: Windows, Linux, macOS)
  - [`path_provider`](https://pub.dev/packages/path_provider) & [`path`](https://pub.dev/packages/path)
- **UI & Interações**:
  - [`flutter_slidable`](https://pub.dev/packages/flutter_slidable) para gestos deslizantes em listas de tarefas.
  - Material 3 Design com temas personalizados (`theme.dart`).
- **Utilitários**:
  - [`intl`](https://pub.dev/packages/intl) para formatação e manipulação de datas.

---

## 📂 Arquitetura e Estrutura de Pastas

```text
lib/
├── assets/
│   └── image/               # Imagens e ícones da aplicação (ex: checkup.png)
├── cadastro_screen.dart     # Tela de cadastro de novos usuários
├── card_task.dart           # Componente de card de tarefa com suporte a slidable e edição
├── dbTask.dart              # Gerenciador e repositório SQLite para tarefas (tb_task)
├── dbUser.dart              # Gerenciador e repositório SQLite para autenticação e notas
├── home_screen.dart         # Tela principal com listagem de tarefas ativas
├── login_screen.dart        # Tela de login e autenticação
├── main.dart                # Ponto de entrada, configuração de tema e inicialização FFI
├── novas_task.dart          # Formulário de criação de nova tarefa
├── splash_screen.dart       # Tela de splash com timer para redirecionamento
├── task.dart                # Modelo de dados da Tarefa (Task)
├── task_concluida.dart      # Tela de histórico/tarefas concluídas
├── theme.dart               # Paleta de cores, tipografia e temas Material
└── user.dart                # Modelo de dados de Usuários e Notas
```

---

## 🗄️ Modelagem do Banco de Dados

O aplicativo utiliza o SQLite para persistir dados localmente:

### 1. Tabela `tb_task` (`tasks.db`)
| Coluna | Tipo | Descrição |
| :--- | :--- | :--- |
| `idTask` | `INTEGER PRIMARY KEY AUTOINCREMENT` | Identificador único da tarefa |
| `title` | `TEXT NOT NULL` | Título da tarefa |
| `description` | `TEXT NOT NULL` | Detalhes/conteúdo da tarefa |
| `dia_hora` | `TEXT NOT NULL` | Data e horário de agendamento |

### 2. Tabela `users` (`notes.db`)
| Coluna | Tipo | Descrição |
| :--- | :--- | :--- |
| `idUser` | `INTEGER PRIMARY KEY AUTOINCREMENT` | Identificador do usuário |
| `nome` | `TEXT NOT NULL` | Nome completo do usuário |
| `email` | `TEXT UNIQUE` | E-mail para acesso |
| `senha` | `TEXT` | Senha cadastrada |

---

## 🚀 Pré-requisitos e Instalação

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado no PATH (versão 3.2.3 ou superior).
- Emulador Android / Dispositivo físico conectado OU suporte Desktop habilitado.
- IDE recomendada: VS Code, Android Studio ou Antigravity IDE.

### Instalação

1. Clone este repositório ou navegue até a pasta do projeto:
   ```bash
   cd appTaskFlutter
   ```

2. Obtenha as dependências do projeto:
   ```bash
   flutter pub get
   ```

3. Verifique se o ambiente de desenvolvimento está pronto:
   ```bash
   flutter doctor
   ```

---

## 💻 Como Executar

Para rodar o aplicativo no dispositivo padrão ou conectado:

```bash
flutter run
```

### Rodando em plataformas específicas:
- **Windows**:
  ```bash
  flutter run -d windows
  ```
- **Android**:
  ```bash
  flutter run -d android
  ```
- **Navegador (Web)**:
  ```bash
  flutter run -d chrome
  ```

---

## 📄 Licença

Este projeto é desenvolvido para fins de estudo e produtividade pessoal. Sinta-se à vontade para utilizar, sugerir melhorias e contribuir!
