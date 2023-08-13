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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () => Get.back(), child: const Icon(Icons.arrow_back)
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => GameSquare(
                      color: gameController.colorRed.value,
                      onTap: () => gameController.onTapButton(ColorButton.red),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Obx(() => GameSquare(
                      color: gameController.colorBlue.value,
                      onTap: () => gameController.onTapButton(ColorButton.blue),
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
                      color: gameController.colorGreen.value,
                      onTap: () => gameController.onTapButton(ColorButton.green),
                    )),
                const SizedBox(
                  width: 20,
                ),                
                Obx(() => GameSquare(
                      color: gameController.colorYellow.value,
                      onTap: () => gameController.onTapButton(ColorButton.yellow),
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
                child: const Text('Jogar'),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Obx(() => Text('Pontuação: ${gameController.score.value}')),
            const SizedBox(
              height: 40,
            ),
          ],
        )
      ),
    );
  }
}
