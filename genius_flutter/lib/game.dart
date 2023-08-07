import 'package:flutter/material.dart';
import 'package:genius_flutter/controllers/game_controller.dart';
import 'package:get/get.dart';

import 'components/game_square.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Jogando'),
          ElevatedButton(
              onPressed: () => Get.back(), child: const Icon(Icons.arrow_back)),
          Obx(() => Text('Pontuação: ${gameController.score.value}')),
          ElevatedButton(
              onPressed: () => gameController.playButtonAnimation(0),
              child: const Text('Jogar')),
          const SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => GameSquare(
                    color: gameController.color_red.value,
                    onTap: () => gameController.redOnTap(),
                  )),
              const SizedBox(
                width: 20,
              ),
              Obx(() => GameSquare(
                    color: gameController.color_blue.value,
                    onTap: () => gameController.blueOnTap(),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => GameSquare(
                    color: gameController.color_green.value,
                    onTap: () => gameController.greenOnTap(),
                  )),
              const SizedBox(
                width: 20,
              ),
              Obx(() => GameSquare(
                    color: gameController.color_yellow.value,
                    onTap: () => gameController.yellowOnTap(),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
