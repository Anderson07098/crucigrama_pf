import 'package:flutter/material.dart';
import 'levels_screen.dart';
import 'dificultad_screen.dart';

class DificultadScreen extends StatefulWidget {
  final Function(String) onSelect;
  const DificultadScreen({super.key, required this.onSelect});

  @override
  State<DificultadScreen> createState() => _DificultadScreenState();
}

class _DificultadScreenState extends State<DificultadScreen> {
  @override
  Widget build(BuildContext context) {
    final dificultades = [
      {'titulo': 'Fácil', 'desc': 'Ideal para principiantes.'},
      {'titulo': 'Normal', 'desc': 'Un desafío equilibrado.'},
      {'titulo': 'Difícil', 'desc': 'Para jugadores experimentados.'},
      {'titulo': 'Experto', 'desc': 'Solo para maestros.'},
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Seleccionar Dificultad',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          const SizedBox(height: 8),
          ...dificultades.map((dif) {
            final titulo = dif['titulo']!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelsScreen(dificultad: titulo),
                    ),
                  );
                  if (!mounted) return;
                  if (result != null && result is String) {
                    widget.onSelect(result);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context, result);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dif['desc']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DificultadScreen(
                    onSelect: (dificultad) {
                      // Aquí puedes manejar la dificultad seleccionada
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'Dificultad',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
