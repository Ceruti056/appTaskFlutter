class Users {
  final int? idUser;
  final String nome;
  final String senha;
  final String email;

  Users({
    this.idUser,
    required this.nome,
    required this.senha,
    required this.email
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        idUser: json["idUser"],
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "nome": nome,
        "email" : email,
        "senha": senha,
      };
}

class NoteModel {
  final int? noteId;
  final String noteTitle;
  final String noteContent;
  final String createdAt;

  NoteModel({
    this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.createdAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
        noteId: json["noteId"],
        noteTitle: json["noteTitle"],
        noteContent: json["noteContent"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "noteId": noteId,
        "noteTitle": noteTitle,
        "noteContent": noteContent,
        "createdAt": createdAt,
      };
}