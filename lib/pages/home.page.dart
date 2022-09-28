import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/login.page.dart';
import 'package:vacancies_go/repository/usuario.repository.dart';
import 'package:vacancies_go/controllers/home.controller.dart';
import 'package:vacancies_go/models/usuario.model.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  UsuarioModel? dadosDoUsuario;
  
  HomeController homeController = HomeController();

  carregarDadosDoUsuario() async {
    UsuarioModel usuarioLocal = await homeController.popularUsuario();
    setState(() {
      dadosDoUsuario = usuarioLocal;
    });
  }

  @override
  void initState() {
    carregarDadosDoUsuario();
    super.initState();
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
          "Bem Vindo ao VacanciesGo ${dadosDoUsuario?.nomeDeUsuario})",
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
              accountEmail: Text("Email do usuário: ${dadosDoUsuario?.email}"),
              accountName:  Text("Nome do usuário: ${dadosDoUsuario?.nomeDeUsuario}"),
              currentAccountPicture: CircleAvatar(
              child: Text("***"),
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
