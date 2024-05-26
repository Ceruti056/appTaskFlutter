import 'package:apptask/cadastro_screen.dart';
import 'package:apptask/dbTask.dart';
import 'package:apptask/home_screen.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Future<List<User>> futureUsers;
  late User user;
  final DB db = DB();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task', style: TextStyle(fontSize: 48)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: emailController,
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
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomeScreen(
                          user: User(
                              idUser: 1,
                              email: "sdws",
                              nome: "swdws",
                              senha: "sdsd"))));
                },
                child: const Text('Logar')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>  CadastroScreen(user: User(idUser: 1, nome: 'dcs', email: 'csvsvs', senha: 'idfvsjfv'),)));
                },
                child: const Text('Não possui conta? Cadastre-se')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => HomeScreen(user: User(
                          idUser: 1,
                          email: "sdws",
                          nome: "swdws",
                          senha: "sdsd"))));
                },
                child: const Text('Esqueceu sua senha? Clique aqui')),
          ],
        ),
      ),
    );
  }
}
