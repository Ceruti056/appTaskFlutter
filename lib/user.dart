class User {
  final String idUser;
  final String nome;
  final String email;
  final String senha;

  User(
      {required this.idUser,
      required this.nome,
      required this.email,
      required this.senha});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'] ?? 'default_id',
      nome: json['nome'] ?? 'N/A',
      email: json['email'] ?? 'N/A',
      senha: json['senha'] ?? '*****',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }
}
