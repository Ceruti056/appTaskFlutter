import 'package:apptask/dbTask.dart';
import 'package:apptask/home_screen.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

class NovaTaskPage extends StatefulWidget {
  const NovaTaskPage({
    Key? key,
    required this.user,
  }) : super(key: key);

 final Users user;

  @override
  State<NovaTaskPage> createState() => _NovaTaskPageState();
}

class _NovaTaskPageState extends State<NovaTaskPage> {
  late final Task task;

@override
void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      futureTasks = db.getAllTask();
    });
  }

  late Future<List<Task>> futureTasks;
  DB db = DB();


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
                  _refreshList();
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
      title: const Text('Nova Task'),
      centerTitle: true,
      actions: [
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: TextButton.icon(
                    onPressed: () {
                      _showSnackbar('Você já está na página Nova Task.', Colors.blue);
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
                    return HomeScreen(user: widget.user);
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

  void _addTask() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dia_horaController.text.isNotEmpty) {
      db
          .addTask(Task(
            idTask: task.idTask,
              title: titleController.text, //
              description: descriptionController.text,
              dia_hora: DateTime.now().toIso8601String()))
          .then((newTask) {
        _showSnackbar('Task criada com sucesso!', Colors.green);
      }).catchError((error) {
        _showSnackbar('Falha em adicionar uma nova task: $error', Colors.red);
        _refreshList();
        //_clear();
      });
    } else {
      _showSnackbar('Preencha todos os campos obrigatórios', Colors.red);
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _clear() {
    titleController.text = "";
    descriptionController.text = "";
    dia_horaController.text = "";
  }
}
