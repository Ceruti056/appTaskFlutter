import 'package:apptask/novas_task.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete, edit }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = allTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _menuBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return Slidable(
                    key: Key(task.titulo),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(
                          onDismissed: () =>
                              _deleteAndEditTasks(index, Actions.edit)),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.lightBlueAccent,
                          icon: Icons.edit_outlined,
                          label: 'Edit',
                          onPressed: (context) =>
                              _deleteAndEditTasks(index, Actions.edit),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        dismissible: DismissiblePane(
                            onDismissed: () =>
                                _deleteAndEditTasks(index, Actions.delete)),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) =>
                                _deleteAndEditTasks(index, Actions.delete),
                          )
                        ]),
                    child: _buildTaskListTile(task),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _deleteAndEditTasks(int index, Actions action) {
    final task = tasks[index];
    setState(() => tasks.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackbar(context, '${task.titulo} foi deletado', Colors.red);
        break;
      case Actions.edit:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NovaTaskPage();
        }));
        break;
    }
  }

  Widget _buildTaskListTile(Task task) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(task.titulo),
        subtitle: Text(task.data),
        leading: Text(task.hora),
      );

  AppBar _menuBar() {
    return AppBar(
      title: const Text('Minhas Tasks'),
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
          ];
        }),
      ],
    );
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Widget _buildCard() {
  //   return Container(
  //     height: 150,
  //     width: MediaQuery.of(context).size.width,
  //     padding: const EdgeInsets.all(10.0),
  //     child: Card(
  //       color: cardCor,
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return HomeScreen();
  //           }));
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Container(
  //                 alignment: Alignment.centerLeft,
  //                 child: const Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text("Nome"),
  //                     Text("Data"),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 alignment: Alignment.bottomRight,
  //                 child: const Text("hora", textDirection: TextDirection.rtl),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
