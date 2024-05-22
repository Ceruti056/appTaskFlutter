final String tableTask = 'notesTask';

class NoteFieldTask {
static final List<String> values = [
  //Add all fields
  idTask, titulo, descricao, dia_hora
];

  static final String idTask = '_idTask';
  static final String titulo = 'titulo';
  static final String descricao = 'descricao';
  static final String dia_hora = 'dia_hora';
}

class Task {
  final int? idTask;
  final String titulo;
  final String descricao;
  final DateTime dia_hora;

  Task({
    required this.idTask,
    required this.titulo,
    required this.descricao,
    required this.dia_hora,
  });

  Task copy({
     final int? idTask,
  final String? titulo,
  final String? descricao,
  final DateTime? dia_hora,
  }) =>
        Task(
          idTask: idTask ?? this.idTask, 
          titulo: titulo ?? this.titulo, 
          descricao: descricao ?? this.descricao, 
          dia_hora: dia_hora ?? this.dia_hora
          );

  static Task fromJson(Map<String, Object?> json) => Task(
    idTask:  json[NoteFieldTask.idTask] as int?,
    titulo: json[NoteFieldTask.titulo] as String,
    descricao: json[NoteFieldTask.descricao] as String,
    dia_hora: DateTime.parse(json[NoteFieldTask.dia_hora] as String),
  );

   Map<String, Object?> toJson() => {
   NoteFieldTask.idTask: idTask,
   NoteFieldTask.titulo: titulo,
   NoteFieldTask.descricao: descricao,
   NoteFieldTask.dia_hora: dia_hora.toIso8601String()
};

// final allTasks = [
//   Task(
//       idTask: 1,
//       titulo: 'Ze',
//       descricao: 'dyhsdhfvhbsjhvbuhsvb',
//       dia_hora: 'ddghfy'),
//   Task(
//       idTask: 1,
//       titulo: 'Claudin',
//       descricao: 'dyhsdhfvhbsjhvbuhsvb',
//       dia_hora: '15:46  20/08/2023'),
//   Task(
//       idTask: 3,
//       titulo: 'Marquinhos',
//       descricao: 'dyhsdhfvhbsjhvbuhsvb',
//       dia_hora: '19:46  20/08/2024')
// ];
}