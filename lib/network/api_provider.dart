import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/dados_user.dart';

class ApiProvider {
  ApiProvider();

  Future<DadosUser> buscarUsuario(String usuario, BuildContext context) async {
    String _baker = '';
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Buscando usuário...")));
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$usuario'));

    ScaffoldMessenger.of(context).clearSnackBars();

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final DadosUser dadosUser = DadosUser.fromJson(dados);
      _baker = dados['baker'] ?? 'padeiro';
      // _usuario = dados['login'];
      // _nome = dados['name'] ?? "<Sem nome>";
      // _biografia = dados['bio'] ?? "<Sem biografia>";
      return dadosUser;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Ocorreu um erro ao buscar o usuário.")));
      return DadosUser(
          login: "Erro",
          nome: "Erro",
          bio: "Erro",
          avatarUrl: "https://cdn-icons-png.flaticon.com/512/25/25231.png");
    }
  }
}
