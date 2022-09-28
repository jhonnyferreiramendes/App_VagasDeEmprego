import 'dart:convert';

class UsuarioModel {
  String? nomeDeUsuario;
  String? sexo;
  String? cidade;
  String? email;
  String? senha;
  String? dadosDoUsuario;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.sexo,
    required this.cidade,
    required this.email,
    required this.senha,
  });

  UsuarioModel.usuarioVazio();

  UsuarioModel.fromMap(Map<String, dynamic> dados) {
    email = dados['email'];
    nomeDeUsuario = dados['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeDeUsuario": nomeDeUsuario,
      "sexo": sexo,
      "cidade": cidade,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
