import 'package:flutter_beep/flutter_beep.dart';

Future<void> delay(int seconds, Function executar) async {
  Future.delayed(Duration(seconds: seconds), () async {
    await executar();
  });
}

void playSound() {
  FlutterBeep.beep();
}
