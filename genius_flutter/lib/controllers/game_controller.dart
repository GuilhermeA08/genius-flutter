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

  var color_red = Colors.red[500].obs;
  var color_blue = Colors.blue[500].obs;
  var color_green = Colors.green[500].obs;
  var color_yellow = Colors.yellow[500].obs;

  List<ColorButton> sequence = [ColorButton.red];

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
        this.color_red.value = Color.fromARGB(255, 255, 0, 0);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        this.color_red.value = Colors.red[500];
        break;
      case ColorButton.blue:
        this.color_blue.value = Color.fromARGB(255, 0, 21, 255);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        this.color_blue.value = Colors.blue[500];
        break;
      case ColorButton.green:
        this.color_green.value = Color.fromARGB(255, 4, 255, 0);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        this.color_green.value = Colors.green[500];
        break;
      case ColorButton.yellow:
        this.color_yellow.value = Color.fromARGB(255, 246, 255, 0);
        playSound();
        await esperarPorSegundos(0, milliseconds: 500);
        this.color_yellow.value = Colors.yellow[500];
        break;
      default:
    }
    debugPrint("Awai");
  }
}
