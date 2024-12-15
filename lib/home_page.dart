import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = 'Frases do Dia!!!';
  final _frases = [
    'Gratidão não é pagamento, mas um reconhecimeto que se demonstra no dia a dia.',
    'Nem toda mudança importante acontece de repente e faz barulho.',
    'Sou apenas um pequeno planeta que se perde diariamente em todo seu universo.',
    'Novas amizades serão sempre bem vindas para darem cor e alegria ao meu mundo.',
    'O Senhor é o meu Pastor e nada me faltará.',
    'Jesus Cristo é o Senhor!!!',
    'Louve ao Senhor Deus em todo tempo.',
  ];

  final _masterPhrase = 'Clique  no botão para gerar uma frase!!!';
  var _generatedPhrase = ' ';

  void _gerarFrase() {
    // gerar numeros randomicos
    var drawnNumber = Random().nextInt(_frases.length);

    setState(() {
      _generatedPhrase = _frases[drawnNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.black,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.blueGrey.shade600,
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/logo.png'),
              Shimmer.fromColors(
                baseColor: Colors.green,
                highlightColor: Colors.yellow,
                child: Text(
                  _masterPhrase,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                _generatedPhrase,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black,
                ),
                onPressed: _gerarFrase,
                child: const Text(
                  'Nova Frase',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
