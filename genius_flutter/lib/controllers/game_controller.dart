import 'dart:math';

import 'package:beep_player/beep_player.dart';
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

  var score = 0.obs;

  var colorRed = Colors.red[800].obs;
  var colorBlue = Colors.blue[800].obs;
  var colorGreen = Colors.green[800].obs;
  var colorYellow = Colors.yellow[800].obs;

  List<ColorButton> sequence = [];

  // Iterator de sequence
  late Iterator<ColorButton> sequenceIterator;

  void initializeSequence() {
    sequenceIterator = sequence.iterator;
  }

  void increment() {
    score++;
  }

  ColorButton getRandColor() {
    var rand = Random();
    return ColorButton.values[rand.nextInt(4)];
  }

  void playSequence() async {
    for (var color in sequence) {
      await esperarPorSegundos(1, milliseconds: 500);
      onTapButton(color);
    }
  }

  bool checkSequence() {
    sequenceIterator.current;
    return true;
  }

  void runGame() async {
    sequence.add(getRandColor());
    playSequence();
    debugPrint("$sequence");
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
