import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moto_provider.dart';
import 'moto.dart';

class PrimeraPagina extends StatelessWidget {
  const PrimeraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MotoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona una moto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<Moto>(
              value: provider.motoSeleccionada,
              isExpanded: true,
              items: provider.motos
                  .map(
                    (m) =>
                        DropdownMenuItem(value: m, child: Text(m.marcaModelo)),
                  )
                  .toList(),
              onChanged: (moto) {
                if (moto != null) provider.canviarMoto(moto);
              },
            ),

            const SizedBox(height: 12),

            Text(
              provider.motoSeleccionada.marcaModelo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/segona');
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
