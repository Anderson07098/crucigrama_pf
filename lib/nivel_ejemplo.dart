import 'package:flutter/material.dart';

class Palabra {
  final int numero;
  final String imagen;
  final String direccion; // 'horizontal' o 'vertical'
  final int fila;
  final int columna;
  final int longitud;
  Palabra({
    required this.numero,
    required this.imagen,
    required this.direccion,
    required this.fila,
    required this.columna,
    required this.longitud,
  });
}

class NivelEjemplo extends StatefulWidget {
  const NivelEjemplo({super.key});

  @override
  State<NivelEjemplo> createState() => _NivelEjemploState();
}

class _NivelEjemploState extends State<NivelEjemplo> {
  final List<List<bool>> tablero = const [
    [true, true, true, true, false],
    [true, false, true, false, true],
    [true, true, true, true, true],
    [false, true, false, true, false],
    [true, true, true, false, true],
  ];

  final List<String> imagenes = [
    'assets/imagenes/Facil/perro.jpg',
    'assets/imagenes/Facil/gato.jpeg',
    'assets/imagenes/Facil/sol.png',
    'assets/imagenes/Facil/pan.jpeg',
    'assets/imagenes/Facil/flor.jpeg',
  ];

  late final List<Palabra> palabras;
  late List<List<String>> letras;

  @override
  void initState() {
    super.initState();
    palabras = [
      Palabra(
        numero: 1,
        imagen: imagenes[0],
        direccion: 'horizontal',
        fila: 0,
        columna: 0,
        longitud: 4,
      ),
      Palabra(
        numero: 2,
        imagen: imagenes[1],
        direccion: 'vertical',
        fila: 0,
        columna: 2,
        longitud: 5,
      ),
      Palabra(
        numero: 3,
        imagen: imagenes[2],
        direccion: 'horizontal',
        fila: 2,
        columna: 0,
        longitud: 5,
      ),
      Palabra(
        numero: 4,
        imagen: imagenes[3],
        direccion: 'vertical',
        fila: 0,
        columna: 4,
        longitud: 3,
      ),
      Palabra(
        numero: 5,
        imagen: imagenes[4],
        direccion: 'horizontal',
        fila: 4,
        columna: 0,
        longitud: 2,
      ),
    ];
    letras = List.generate(
      tablero.length,
      (i) => List.generate(tablero[0].length, (j) => ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mapa para saber si una celda es inicio de palabra
    Map<String, Palabra> inicioCelda = {};
    for (var p in palabras) {
      inicioCelda['${p.fila},${p.columna}'] = p;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Nivel de ejemplo'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Imágenes con numeración
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 12,
              children: List.generate(
                palabras.length,
                (i) => Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(palabras[i].imagen, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${palabras[i].numero}.',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Tablero editable con flechas/números solo en la celda de inicio de cada palabra
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  tablero.length,
                  (i) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(tablero[i].length, (j) {
                      if (!tablero[i][j]) {
                        return Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.all(2),
                          color: Colors.transparent,
                        );
                      }
                      Palabra? p = inicioCelda['$i,$j'];
                      return Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              border: Border.all(
                                color: Colors.red, // Rojo para el borde
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    letras[i][j] = val.toUpperCase();
                                  });
                                },
                                controller: TextEditingController(
                                  text: letras[i][j],
                                ),
                              ),
                            ),
                          ),
                          if (p != null)
                            Positioned(
                              left: 2,
                              top: 2,
                              child: Row(
                                children: [
                                  if (p.direccion == 'horizontal')
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                  if (p.direccion == 'vertical')
                                    const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                  Text(
                                    '${p.numero}',
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text('Volver al Menú'),
            ),
          ],
        ),
      ),
    );
  }
}
