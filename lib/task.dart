class Task {
  final String idTask;
  final String titulo;
  final String descricao;
  final String data;
  final String hora;

  Task(
      {required this.idTask,
      required this.titulo,
      required this.descricao,
      required this.data,
      required this.hora});
}

final allTasks= [
   Task(
    idTask: '1',
     titulo: 'Ze', 
     descricao: 'dyhsdhfvhbsjhvbuhsvb', 
     data: '03/05/2024', 
     hora: '12:50'),

     Task(
    idTask: '2',
     titulo: 'Claudin', 
     descricao: 'dyhsdhfvhbsjhvbuhsvb', 
     data: '03/05/2021', 
     hora: '12:30'),

     Task(
    idTask: '3',
     titulo: 'Marquinhos', 
     descricao: 'dyhsdhfvhbsjhvbuhsvb', 
     data: '03/05/2028', 
     hora: '12:10')
];
