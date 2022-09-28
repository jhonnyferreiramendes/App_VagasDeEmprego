import 'package:vacancies_go/models/usuario.model.dart';
import 'package:vacancies_go/repository/usuario.repository.dart';

class HomeController {
  UsuarioModel? usuarioModel;

  UsuarioRepository usuarioRepository = UsuarioRepository();

  Future<UsuarioModel> popularUsuario() async {
    Map<String, dynamic> dadosLocais = await usuarioRepository.retornarNomeEEmail();

    usuarioModel = UsuarioModel.fromMap(dadosLocais);

    return usuarioModel!;
  }
} 