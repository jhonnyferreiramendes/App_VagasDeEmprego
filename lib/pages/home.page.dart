import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/login.page.dart';
import 'package:vacancies_go/repository/usuario.repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nomeDoUsuario = "";
  UsuarioRepository userRe = UsuarioRepository();

  carregarDadosDoUsuario() async {
    String? nome = await userRe.retornarNomeUsuario();

    setState(() {
      _nomeDoUsuario = nome!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [Colors.blue, Colors.red],
        ))),
        title: Text(
          "Bem Vindo ao VacanciesGo $_nomeDoUsuario",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            tooltip: "Deslogar",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "Login"),
                ),
                ModalRoute.withName('/login'),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("igorkwan@gmail.com"),
              accountName: Text("Ygor Kwan"),
              currentAccountPicture: CircleAvatar(
                child: Text("YK"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
