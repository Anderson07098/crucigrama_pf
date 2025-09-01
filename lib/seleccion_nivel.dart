import 'package:flutter/material.dart';

class SeleccionNivel extends StatelessWidget {
  final String dificultad;
  const SeleccionNivel({super.key, required this.dificultad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Dificultad: $dificultad'),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1,
          ),
          itemCount: 15,
          itemBuilder: (context, index) {
            final nivel = index + 1;
            final esSeleccionado = nivel == 1; // Puedes cambiar la lógica de selección
            return InkWell(
              onTap: () {
                // Acción al seleccionar nivel
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: esSeleccionado ? Colors.orange : Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    '$nivel',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}