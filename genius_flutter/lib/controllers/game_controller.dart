import 'dart:math';

import 'package:flutter/material.dart';
import 'package:genius_flutter/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GameController extends GetxController {
  var score = 0.obs;

  var color_red = Colors.red[500].obs;
  var color_blue = Colors.blue[500].obs;
  var color_green = Colors.green[500].obs;
  var color_yellow = Colors.yellow[500].obs;

  void increment() {
    score++;
  }

  int getRandColor() {
    var rand = Random();
    return rand.nextInt(4);
  }

  void playButtonAnimation(int button) async {
    switch (button) {
      case 0:
        this.color_red.value = Colors.blue[900];
        await delay(1, () => this.color_red.value = Colors.red[500]);
        break;
      default:
    }
  }

  void runGame() {}

  void redOnTap() {
    color_red.value = Colors.red[200];
    increment();
  }

  void blueOnTap() {
    color_blue.value = Colors.blue[200];
    increment();
  }

  void greenOnTap() {
    color_green.value = Colors.green[200];
    increment();
  }

  void yellowOnTap() {
    color_yellow.value = Colors.yellow[200];
    increment();
  }
}
