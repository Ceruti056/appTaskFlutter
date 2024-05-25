import 'package:apptask/db.dart';
import 'package:apptask/novas_task.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    _refreshUserList();
  }

 late Future<List<Task>> futureTasks;
DB db = DB();


  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dia_horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _refreshUserList();
    return Scaffold(
      appBar: _menuBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: ListView.builder(itemBuilder: (context, index) {
              return Slidable(
                key: Key(widget.task.title),
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  dismissible:
                      DismissiblePane(onDismissed: () => _deleteAndEditTasks),
                  children: [
                    SlidableAction(
                        backgroundColor: Colors.lightBlueAccent,
                        icon: Icons.edit_outlined,
                        label: 'Edit',
                        onPressed: (context) => _deleteAndEditTasks),
                  ],
                ),
                endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    dismissible:
                        DismissiblePane(onDismissed: () => _deleteAndEditTasks),
                    children: [
                      SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (context) => _deleteAndEditTasks),
                    ]),
                child: _buildTaskListTile(task),
              );
            }),
          ),
        ],
      ),
    );
  }

  Future<Widget> _deleteAndEditTasks(Task task) async {
    return Wrap(
      spacing: 12,
      children: <Widget>[
        IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditDialog(task)),
        IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showEditDialog(task)),
      ],
    );
  }

  Widget _buildTaskListTile(Task task) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        subtitle: Text(task.dia_hora.toString()),
        leading: Text(task.title),
      );

  AppBar _menuBar() {
    return AppBar(
      title: Text('Minhas Tasks'),
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
                    return const HomeScreen(task: ,);
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

  void _showEditDialog(Task task) {
    titleController.text = task.title;
    descriptionController.text = task.description;
    dia_horaController.text = task.dia_hora.toIso8601String();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar Task"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Título',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
              const SizedBox(height: 30),
              TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
              const SizedBox(height: 30),
              TextFormField(
                  controller: dia_horaController,
                  decoration: const InputDecoration(
                      labelText: 'Data/Hora',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
              const SizedBox(height: 30),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Salvar"),
            onPressed: () {
              _updateTask(task);
              _clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _deleteTask(String id) {
    db
        .deleteTask(Task(
            idTask: task.idTask,
            title: titleController.text,
            description: descriptionController.text,
            dia_hora: DateTime.parse(dia_horaController.text)))
        .then((_) {
      _showSnackbar(
          'A Task ${task.title} deletada com seucesso!', Colors.green);
      _refreshUserList();
    }).catchError((error) {
      _showSnackbar('Falha ao deletar a Task', Colors.red);
    });

    showDialog(context: context, builder: (context) => AlertDialog());
  }

  void _updateTask(Task task) {
    // Inicializa um Map para armazenar apenas os campos permitidos para atualização
    Map<String, dynamic> dataToUpdate = {
      'Título': titleController.text,
      'Descrição': descriptionController.text,
      'Data/Hora': dia_horaController.text,
      // Não inclua 'email' pois é proibido atualizar
    };

    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dia_horaController.text.isNotEmpty) {
      db
          .updateTask(
              Task(
                  idTask: task.idTask,
                  title: titleController.text,
                  description: descriptionController.text,
                  dia_hora: DateTime.parse(dia_horaController.text)),
              dataToUpdate)
          .then((updatedTask) {
        _showSnackbar('Task atualizada com sucesso!', Colors.green);
        _refreshUserList();
        _clear();
      }).catchError((error) {
        _showSnackbar('Falha ao atualizar a Task: $error', Colors.red);
      });
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
