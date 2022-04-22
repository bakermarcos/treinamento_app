import 'package:flutter/material.dart';
import 'package:treinamento_app/pages/contador/contador.dart';
import 'package:treinamento_app/pages/desafio/desafio.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Treinamento Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/71016898?v=4"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Marcos Baker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.yellow.shade900)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ContadorPage()));
                },
                child: const Text("Ir para contador"),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DesafioPage()));
                },
                child: const Text("Desafio"),
              ),
            ],
          ),
        ));
  }
}
