import 'package:flutter/material.dart';

class TiendaScreen extends StatelessWidget {
  const TiendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Compra monedas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Image.asset('assets/imagenes/gold.jpg', width: 48, height: 48,),
                title: const Text('100 monedas'),
                subtitle: const Text('5.00'),
                trailing: ElevatedButton(onPressed: () {}, child: const Text('Comprar')),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Image.asset('assets/imagenes/gold.jpg', width: 48, height: 48,),
                title: const Text('500 monedas'),
                subtitle: const Text('4.50 each'),
                trailing: ElevatedButton(onPressed: () {}, child: const Text('Comprar')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
