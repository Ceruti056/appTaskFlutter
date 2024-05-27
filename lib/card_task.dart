import 'package:apptask/dbTask.dart';
import 'package:apptask/task.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class CardTask extends StatefulWidget {
  const CardTask({super.key, required this.task, required this.user});
  final Task task;
  final Users user;

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController diahoraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _refreshList();
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: FutureBuilder<List<Task>>(
              future: futureTasks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('Nenhuma tarefa encontrada');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final task = snapshot.data![index];
                      return Slidable(
                        key: Key(task.title),
                        startActionPane: ActionPane(
                          motion: const StretchMotion(),
                          dismissible: DismissiblePane(
                              onDismissed: () => _showEditDialog(task)),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.lightBlueAccent,
                              icon: Icons.edit_outlined,
                              label: 'Edit',
                              onPressed: (context) => _showEditDialog(task),
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          dismissible: DismissiblePane(
                              onDismissed: () =>
                                  _deleteTask(task.idTask.toString())),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                              onPressed: (context) =>
                                  _deleteTask(task.idTask.toString()),
                            ),
                          ],
                        ),
                        child: _buildTaskListTile(task),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskListTile(Task task) => ListTile(
      subtitle: Text(DateFormat("yMd").format(DateTime.parse(task.dia_hora))),
      title: Text(task.title),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          _deleteTask(task.idTask.toString());
          _refreshList();
        },
      ),
      onTap: () {
        setState(() {
          titleController.text = task.title;
          descriptionController.text = task.description;
        });
      });

  void _showEditDialog(Task task) {
    titleController.text = task.title;
    descriptionController.text = task.description;
    diahoraController.text = task.dia_hora;

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
                  controller: diahoraController,
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
              //_clear();
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
            idTask: widget.task.idTask,
            title: titleController.text,
            description: descriptionController.text,
            dia_hora: diahoraController.text))
        .then((_) {
      _showSnackbar('A Task ${widget.task.title} foi deletada com sucesso!',
          Colors.green);
      _refreshList();
    }).catchError((error) {
      _showSnackbar('Falha ao deletar a Task', Colors.red);
    });

    showDialog(context: context, builder: (context) => const AlertDialog());
  }

  void _updateTask(Task task) {
    // Inicializa um Map para armazenar apenas os campos permitidos para atualização
    Map<String, dynamic> dataToUpdate = {
      'Título': titleController.text,
      'Descrição': descriptionController.text,
      'Data/Hora': diahoraController.text,
      // Não inclua 'email' pois é proibido atualizar
    };

    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        diahoraController.text.isNotEmpty) {
      db
          .updateTask(
              Task(
                  idTask: task.idTask,
                  title: titleController.text,
                  description: descriptionController.text,
                  dia_hora: diahoraController.text),
              dataToUpdate)
          .then((updatedTask) {
        _showSnackbar('Task atualizada com sucesso!', Colors.green);
        _refreshList();
        //_clear();
      }).catchError((error) {
        _showSnackbar('Falha ao atualizar a Task: $error', Colors.red);
      });
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _clear() {
    titleController.text = "";
    descriptionController.text = "";
    diahoraController.text = "";
  }
}
