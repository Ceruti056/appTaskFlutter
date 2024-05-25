class Task {
  final int idTask;
  final String title;
  final String description;
  final DateTime dia_hora;

  Task({
    required this.idTask,
    required this.title,
    required this.description,
    required this.dia_hora,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    idTask: json['idTask'], 
    title: json['title'], 
    description: json['description'], 
    dia_hora: json['dia_hora']
    );

    Map<String, dynamic> toJson() => {
      'idTask' : idTask,
      'title' : title,
      'description' : description,
      'dia_hora' : dia_hora.toIso8601String()
    };
}
