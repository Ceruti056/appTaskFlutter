class User {
  final int idUser;
  final String nome;
  final String email;
  final String senha;

  User(
      {required this.idUser,
      required this.nome,
      required this.email,
      required this.senha});

      factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json['idUser'], 
    nome: json['nome'], 
    email: json['email'], 
    senha: json['senha']
    );

    Map<String, dynamic> toJson() => {
      'idUser' : idUser,
      'nome' : nome,
      'email' : email,
      'senha' : senha
    };
}
