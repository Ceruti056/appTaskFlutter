import 'package:apptask/db.dart';
import 'package:apptask/home_screen.dart';
import 'package:apptask/task_concluida.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
const CadastroScreen({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
late final User? user;
  late Future<List<User>> futureUsers;
  final DB db = DB();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _refreshUserList();

    nomeController.text = user!.nome;
    emailController.text = user!.email;
   senhaController.text = user!.senha;

    return Scaffold(
      appBar: _menuBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                      controller: nomeController,
                      decoration: const InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: senhaController,
                      decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                _addUser(user!);
                Navigator.pop(context);
              },
              child: const Text('Editar'),
            ),
          ],
        ),
      ),
    );
  }

 AppBar _menuBar() {
    return AppBar(
      title: const Text('Editar'),
      centerTitle: true,
      actions: [
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: TextButton.icon(
                    onPressed: () {
                      //TODO: Implementar a navegação para a tela de HOMESCREEN

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const NovaTaskPage();
                      // }));
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Novas tasks'))),
            PopupMenuItem(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TaskConcluidaPage();
                  }));
                },
                icon: const Icon(Icons.check),
                label: const Text('Tasks Concluídas'),
              ),
            ),
            PopupMenuItem(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen(user: User(idUser: 1, email:"sdws", nome: "swdws", senha: "sdsd" ),);
                  }));
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

  void _addUser(User user) {
    if (nomeController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        senhaController.text.isNotEmpty) {
      db
          .addUser(User(
              idUser: user.idUser,
              nome: nomeController.text, //
              email: emailController.text,
              senha: senhaController.text))
          .then((newUser) {
        _showSnackbar('Usuário criado com sucesso!', Colors.green);
        _refreshUserList();
        _clear();
      }).catchError((error) {
        _showSnackbar('Falha em adicionar uma nova task: $error', Colors.red);
      });
    } else {
      _showSnackbar('Preencha todos os campos obrigatórios', Colors.red);
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _refreshUserList() {
    setState(() {
      futureUsers = db.getAllUser();
    });
  }

  void _clear() {
    nomeController.text = "";
    emailController.text = "";
    senhaController.text = "";
  }
}