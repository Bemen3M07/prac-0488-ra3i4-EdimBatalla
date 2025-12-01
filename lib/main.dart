import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moto_provider.dart';
import 'primera_pagina.dart';
import 'segona_pagina.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => MotoProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcul consum motos',
      theme: ThemeData.light(),
      routes: {
        '/': (_) => const PrimeraPagina(),
        '/segona': (_) => const SegonaPagina(),
      },
    );
  }
}
