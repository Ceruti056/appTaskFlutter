import 'package:apptask/dbTask.dart';
import 'package:apptask/dbUser.dart';
import 'package:apptask/home_screen.dart';
import 'package:apptask/task_concluida.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key, required this.user});
  final String title = "Cadastrar";
  final User user;

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  LoginDB login = LoginDB();

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController resenha = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool mostraSenha = false;
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _menuBar(),
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: senha,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key_outlined),
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ],
              )),
        ));
  }

  void _cadastro() {
    if (nome.text.isNotEmpty &&
        email.text.isNotEmpty &&
        senha.text.isNotEmpty) {
      setState(() {
        _showSnackbar('Preencha todos os campos', Colors.yellow);
      });
    }

    if (senha.text != resenha.text) {
      setState(() {
        _showSnackbar('Senha inválida. Digite novamente', Colors.red);
        senha.text = "";
      });
    }

    if (senha.text == resenha.text) {
      setState(() {
        _showSnackbar('Cadastro realizado com sucesso!', Colors.green);
        login.addUser(User(
            idUser: widget.user.idUser,
            nome: nome.text,
            email: email.text,
            senha: senha.text));
        Navigator.pop(context, '/login');
      });
    }
  }

  AppBar _menuBar() {
    return AppBar(
      title: const Text('Cadastrar'),
      centerTitle: true,
      actions: [
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen(
                          user: User(
                              idUser: widget.user.idUser,
                              nome: nome.text,
                              email: email.text,
                              senha: senha.text),
                        );
                      }));
                      dispose();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Novas tasks'))),
            PopupMenuItem(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TaskConcluidaPage();
                  }));
                  dispose();
                },
                icon: const Icon(Icons.check),
                label: const Text('Tasks Concluídas'),
              ),
            ),
            PopupMenuItem(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen(
                      user: User(
                          idUser: widget.user.idUser,
                          nome: nome.text,
                          email: email.text,
                          senha: senha.text),
                    );
                  }));
                  dispose();
                },
                icon: const Icon(Icons.list),
                label: const Text('Minhas Tasks'),
              ),
            ),
          ];
        }),
      ],
    );
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
