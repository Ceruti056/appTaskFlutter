final String tableUser = 'notesUser';

class NoteFieldUser {
  static final List<String> values = [
    //Add all fields
    idUser, nome, email, senha
  ];

  static final String idUser = '_idUser';
  static final String nome = 'nome';
  static final String email = 'email';
  static final String senha = 'senha';
}

class User {
  final int? idUser;
  final String nome;
  final String email;
  final String senha;

  User(
      {required this.idUser,
      required this.nome,
      required this.email,
      required this.senha});

  User copy({
    final int? idUser,
    final String? nome,
    final String? email,
    final String? senha,
  }) =>
      User(
          idUser: idUser ?? this.idUser,
          nome: nome ?? this.nome,
          email: email ?? this.email,
          senha: senha ?? this.senha);

  static User fromJson(Map<String, Object?> json) => User(
      idUser: json[NoteFieldUser.idUser] as int?,
      nome: json[NoteFieldUser.nome] as String,
      email: json[NoteFieldUser.email] as String,
      senha: json[NoteFieldUser.senha] as String);

  Map<String, Object?> toJson() => {
        NoteFieldUser.idUser: idUser,
        NoteFieldUser.nome: nome,
        NoteFieldUser.email: email,
        NoteFieldUser.senha: senha
      };
}
