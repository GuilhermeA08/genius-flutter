import 'package:flutter/material.dart';

class GameSquare extends StatelessWidget {
  const GameSquare({super.key, this.color, this.onTap});

  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 160,
          height: 160,
          color: Colors.transparent,
        )
      ),
    );
  }
}
