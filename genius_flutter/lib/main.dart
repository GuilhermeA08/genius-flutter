import 'package:flutter/material.dart';
import 'package:genius_flutter/game.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(30, 250, 250, 250),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset('assets/genius-logo.png'),
              const Text(
                'GENIUS',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => Get.to(const GamePage()),
                child: const Text(
                  'Começar o jogo',
                  style: TextStyle(fontSize: 20),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Botão no centro da tela com o texto "Começar o jogo"


