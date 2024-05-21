import 'package:apptask/novas_task.dart';
import 'package:apptask/task_concluida.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 100.0;
  double height = 100.0;
  Offset initialPosition = Offset(0.0, 100.0);
  Offset position = Offset(0.0, 100.0);
  Color cardCor = Color(0xff415f91);
  @override
  void initState() {
    super.initState();
    position = initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _menuBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: position.dx,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  position =
                      Offset(position.dx + details.delta.dx, position.dy);
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  position = initialPosition;
                });
              },
              child: _buildCard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: cardCor,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nome"),
                      Text("Data"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: const Text("hora", textDirection: TextDirection.rtl),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}
