import 'package:apptask/db.dart';
import 'package:apptask/home_screen.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:flutter/material.dart';

class NovaTaskPage extends StatefulWidget {
  const NovaTaskPage({Key? key, this.task}) : super(key: key);

  final Task? task;

  @override
  State<NovaTaskPage> createState() => _NovaTaskPageState();
}

class _NovaTaskPageState extends State<NovaTaskPage> {
  late final Task? task;
  late Future<List<Task>> futureTasks;
  final DB db = DB();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dia_horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _menuBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            labelText: 'Título',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))))),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                            labelText: 'Descrição',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))))),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: dia_horaController,
                        decoration: const InputDecoration(
                            labelText: 'Data/Hora',
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
                  _addTask();
                  Navigator.pop(context);
                },
                child: const Text('Adicionar'),
              ),
            ]),
      ),
    );
  }

  AppBar _menuBar() {
    return AppBar(
      title: Text('Nova Task'),
      centerTitle: true,
      actions: [
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const NovaTaskPage();
                      }));
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
                    return const HomeScreen();
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

  void _addTask() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dia_horaController.text.isNotEmpty) {
      db
          .addTask(Task(
              idTask: task!.idTask,
              title: titleController.text, //
              description: descriptionController.text,
              dia_hora: DateTime.parse(dia_horaController.text)))
          .then((newTask) {
        _showSnackbar('Task criada com sucesso!', Colors.green);
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
      futureTasks = db.getAllTask();
    });
  }

  void _clear() {
    titleController.text = "";
    descriptionController.text = "";
    dia_horaController.text = "";
  }
}
