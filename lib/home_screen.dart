import 'package:apptask/card_task.dart';
import 'package:apptask/db.dart';
import 'package:apptask/novas_task.dart';
import 'package:apptask/task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

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

  void _refreshUserList() {
    setState(() {
      futureTasks = db.getAllTask();
    });
  }

  late Future<List<Task>> futureTasks;
  DB db = DB();

  @override
  Widget build(BuildContext context) {
    _refreshUserList();
    return Scaffold(
        appBar: _menuBar(),
        body: FutureBuilder(
            future: futureTasks,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Task task = snapshot.data![index];
                    return CardTask(
                      task: task,
                      user: widget.user,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }));
  }

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
                        return NovaTaskPage(
                          user: widget.user,
                        );
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
                    return HomeScreen(
                      user: widget.user,
                    );
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
}