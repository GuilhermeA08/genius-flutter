import 'dart:math';

import 'package:beep_player/beep_player.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:genius_flutter/utils/utils.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  static const BeepFile _beepFile = BeepFile(
    'assets/beep-06.wav',
  );

  @override
  void onInit() {
    super.onInit();
    BeepPlayer.load(_beepFile);
  }

  @override
  void dispose() {
    BeepPlayer.unload(_beepFile);
    super.dispose();
  }

  void playSound() {
    BeepPlayer.play(_beepFile);
  }

  var cont = 0;
  var score = 0.obs;
  var phaseNumber = 1;
  var helperText = "".obs;
  var showPlayButton = true.obs;
  var blockTouchSquare = true.obs;

  var colorRed = Colors.red[800].obs;
  var colorBlue = Colors.blue[800].obs;
  var colorGreen = Colors.green[800].obs;
  var colorYellow = Colors.yellow[800].obs;

  List<ColorButton> sequence = [];
  List<ColorButton> informedSequence = [];

  // Iterator de sequence
  late Iterator<ColorButton> sequenceIterator;

  void initializeSequence() {
    sequenceIterator = sequence.iterator;
  }

  void increment() {
    score += phaseNumber++;
  }

  ColorButton getRandColor() {
    var rand = Random();
    return ColorButton.values[rand.nextInt(4)];
  }

  Future<void> playSequence() async {
    for (var color in sequence) {
      await esperarPorSegundos(1, milliseconds: 500);
      onTapButton(color);
    }
  }

  Future<void> compareSequences() async {
    if(cont == sequence.length) {
      if(const ListEquality().equals(sequence, informedSequence)) {
        helperText.value = "Você acertou!";
        increment();
        await esperarPorSegundos(1, milliseconds: 500);
        helperText.value = "";
        blockTouchSquare.value = true;
        runGame();
      }

      cont = 0;
      informedSequence = [];
    }
  }

  Future<void> onUserTap(ColorButton colorButton) async {
    informedSequence.add(colorButton);

    if(informedSequence[cont] != sequence[cont]) {
      helperText.value = "Você perdeu!";
      score.value = 0;
      await esperarPorSegundos(1, milliseconds: 500);
      helperText.value = "";
      Get.back();
    }

    cont++;
    compareSequences();
  }

  void runGame() async {
    sequence.add(getRandColor());
    await playSequence();
    await esperarPorSegundos(1);
    helperText.value = "Sua vez!";
    blockTouchSquare.value = false;
  }

  Future<void> onTapButton(ColorButton colorButton) async {
    switch (colorButton) {
      case ColorButton.red:
        colorRed.value = const Color.fromARGB(255, 255, 50, 50);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        colorRed.value = Colors.red[900];
        break;
      case ColorButton.blue:
        colorBlue.value = const Color.fromARGB(255, 0, 180, 255);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        colorBlue.value = Colors.blue[800];
        break;
      case ColorButton.green:
        colorGreen.value = const Color.fromARGB(255, 30, 210, 70);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        colorGreen.value = Colors.green[800];
        break;
      case ColorButton.yellow:
        colorYellow.value = const Color.fromARGB(255, 255, 255, 80);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        colorYellow.value = Colors.yellow[800];
        break;
      default:
    }
    debugPrint("Awai");
  }
}
