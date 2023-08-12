import 'dart:async';
import 'dart:ffi';

Future<void> delay(Float seconds, Function executar) async {
  await Future.wait([delayedExecution(executar)]);
}

Future<void> delayedExecution(Function executar) async {
  await Future.delayed(const Duration(seconds: 2));
  return executar();
}

Future<void> esperarPorSegundos(int segundos, {int milliseconds = 0}) async {
  await Future.delayed(Duration(seconds: segundos, milliseconds: milliseconds));
}

enum ColorButton { red, blue, green, yellow }
