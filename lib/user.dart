class User {
  int idUser = 0;
  String nome = "";
  String email = "";
  String senha = "";

  User({required this.idUser, required this.nome, required this.email, required this.senha});

  Map<String, dynamic> toMap() {
    
    var map = <String, dynamic>{'nome': nome, 'email': email, 'senha': senha};

    return map;
  }

  User.fromMap(Map<dynamic,dynamic> map){
    nome = map['nome'];
    email = map['email'];
    senha = map['senha'];
  }
}
