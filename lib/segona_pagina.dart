import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moto_provider.dart';
import 'moto.dart';

class SegonaPagina extends StatefulWidget {
  const SegonaPagina({super.key});

  @override
  State<SegonaPagina> createState() => _SegonaPaginaState();
}

class _SegonaPaginaState extends State<SegonaPagina> {
  final TextEditingController _kmRepostatgeController = TextEditingController();
  final TextEditingController _kmActualsController = TextEditingController();

  String _resultat = '';

  @override
  void initState() {
    super.initState();

    _kmRepostatgeController.addListener(_actualitzar);
    _kmActualsController.addListener(_actualitzar);
  }

  @override
  void dispose() {
    _kmRepostatgeController.dispose();
    _kmActualsController.dispose();
    super.dispose();
  }

  double _calcularAutonomiaTeorica(Moto moto) {
    return (moto.fuelTankLiters / moto.consumptionL100) * 100;
  }

  void _actualitzar() {
    final moto = Provider.of<MotoProvider>(
      context,
      listen: false,
    ).motoSeleccionada;
    _calcular(moto);
  }

  void _calcular(Moto moto) {
    final double? kmRep = double.tryParse(_kmRepostatgeController.text);
    final double? kmAct = double.tryParse(_kmActualsController.text);

    if (kmRep == null || kmAct == null) {
      setState(() {
        _resultat = 'Introdueix nombres vàlids.';
      });
      return;
    }

    if (kmAct < kmRep) {
      setState(() {
        _resultat =
            'Els km actuals no poden ser menors que els km en repostar.';
      });
      return;
    }

    final double autonomia = _calcularAutonomiaTeorica(moto);
    final double kmFets = kmAct - kmRep;
    double kmRestants = autonomia - kmFets;
    if (kmRestants < 0) kmRestants = 0;

    setState(() {
      _resultat =
          'Autonomia teòrica: ${autonomia.toStringAsFixed(1)} km\n'
          'Has fet ${kmFets.toStringAsFixed(1)} km des del repostatge.\n'
          'Et queden aproximadament ${kmRestants.toStringAsFixed(1)} km.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final moto = Provider.of<MotoProvider>(context).motoSeleccionada;

    return Scaffold(
      appBar: AppBar(title: const Text('Detall i càlcul')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Moto: ${moto.marcaModelo}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text('Dipòsit: ${moto.fuelTankLiters} L'),
              Text('Consum: ${moto.consumptionL100} L/100km'),

              const SizedBox(height: 20),

              TextField(
                controller: _kmRepostatgeController,
                decoration: const InputDecoration(
                  labelText: 'Km quan vas omplir el dipòsit',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              TextField(
                controller: _kmActualsController,
                decoration: const InputDecoration(
                  labelText: 'Km actuals',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),
              Text(_resultat),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tornar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
