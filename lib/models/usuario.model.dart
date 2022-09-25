import 'dart:convert';

class UsuarioModel {
  String? nomeDeUsuario;
  String? sexo;
  String? cidade;
  String? email;
  String? senha;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.sexo,
    required this.cidade,
    required this.email,
    required this.senha,
  });

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
