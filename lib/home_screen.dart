import 'package:apptask/db.dart';
import 'package:apptask/edit_task.dart';
import 'package:apptask/novas_task.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete, edit }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.task}) : super(key: key);

  final Task? task;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Task>> futureTasks;
  late final Task task;
  final DB db = DB();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dia_horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _menuBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: Key(task.title),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(
                          onDismissed: () => _showSnackbar(context,
                              '${task.title} foi deletado', Colors.red)),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.lightBlueAccent,
                          icon: Icons.edit_outlined,
                          label: 'Edit',
                          onPressed: (context) => _deleteAndEditTasks(task),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () => _deleteAndEditTasks(task),
                        ),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) => _deleteAndEditTasks(task),
                          ),
                        ]),
                    child: _buildTaskListTile(task),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<Widget> _deleteAndEditTasks(Task tasks) async {
    return Wrap(
      spacing: 12,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EditTaskPage();
            }));
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.delete),
        //   onPressed: () =>
        // ),
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

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
