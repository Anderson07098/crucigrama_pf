import 'package:flutter/material.dart';

class FondoGeneral extends StatelessWidget {
  final Widget child;
  const FondoGeneral({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/imagenes/fondo_general.png',
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
