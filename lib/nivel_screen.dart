import 'package:flutter/material.dart';

class NivelScreen extends StatelessWidget {
  final int nivel;
  final String imagen;
  final String dificultad;
  const NivelScreen({super.key, required this.nivel, required this.imagen, required this.dificultad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Nivel $nivel - $dificultad', style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagen,
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            Text(
              'Nivel $nivel',
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'completado');
              },
              child: const Text('Completar nivel'),
            ),
          ],
        ),
      ),
    );
  }
}
