import 'package:flutter/material.dart';
import 'package:genius_flutter/controllers/game_controller.dart';
import 'package:genius_flutter/utils/utils.dart';
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
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Text(
                gameController.helperText.value,
                style: const TextStyle(fontSize: 20),
              )
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Obx(() => GameSquare(
                    color: gameController.colorRed.value,
                    onTap: () => {
                      gameController.onTapButton(ColorButton.red),
                      gameController.onUserTap(ColorButton.red)
                    }
                  )
                ),
                const SizedBox(
                  width: 20,
                ),
                Obx(() => GameSquare(
                    color: gameController.colorBlue.value,
                    onTap: () => {
                      gameController.onTapButton(ColorButton.blue),
                      gameController.onUserTap(ColorButton.blue)
                    }
                  )
                ),
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
                    color: gameController.colorGreen.value,
                    onTap: () => {
                      gameController.onTapButton(ColorButton.green),
                      gameController.onUserTap(ColorButton.green)
                    }
                  )
                ),
                const SizedBox(
                  width: 20,
                ),                
                Obx(() => GameSquare(
                    color: gameController.colorYellow.value,
                    onTap: () => {
                      gameController.onTapButton(ColorButton.yellow),
                      gameController.onUserTap(ColorButton.yellow)
                    }
                  )
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () => gameController.runGame(),
                child: const Text(
                  'Jogar',
                  style: TextStyle(fontSize: 20),
                )
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => Text(
                'Pontuação: ${gameController.score.value}',
                style: const TextStyle(fontSize: 20),
              )
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        )
      ),
    );
  }
}
