import 'package:flutter/material.dart';
import 'package:treinamento_app/model/dados_user.dart';
import 'package:treinamento_app/network/api_provider.dart';

class DesafioPage extends StatefulWidget {
  const DesafioPage({Key? key}) : super(key: key);

  @override
  State<DesafioPage> createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  final TextEditingController _controllerUsuario = TextEditingController();
  DadosUser dadosUser = DadosUser(
      login: "",
      nome: "",
      bio: "",
      avatarUrl: "https://cdn-icons-png.flaticon.com/512/25/25231.png");
  final estiloPadrao =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final Function _buscarUsuario = ApiProvider().buscarUsuario;
  @override
  void dispose() {
    _controllerUsuario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Desafio'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    backgroundImage: NetworkImage(dadosUser.avatarUrl)),
                const SizedBox(height: 5),
                Text('Usuário: ${dadosUser.login}', style: estiloPadrao),
                const SizedBox(height: 5),
                Text('Nome: ${dadosUser.nome}', style: estiloPadrao),
                const SizedBox(height: 5),
                Text(
                  'Biografia: ${dadosUser.bio}',
                  textAlign: TextAlign.center,
                  style: estiloPadrao,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerUsuario,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: const Text('Buscar'),
                  onPressed: () async {
                    dadosUser =
                        await _buscarUsuario(_controllerUsuario.text, context);
                    setState(() {});
                  },
                )
              ])),
        ));
  }
}
