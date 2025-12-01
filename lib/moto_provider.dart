import 'package:flutter/foundation.dart';
import 'moto.dart';

class MotoProvider extends ChangeNotifier {
  final List<Moto> motos = [
    Moto(
      marcaModelo: 'Honda PCX 125',
      fuelTankLiters: 8.0,
      consumptionL100: 2.1,
    ),
    Moto(
      marcaModelo: 'Yamaha NMAX 125',
      fuelTankLiters: 7.1,
      consumptionL100: 2.2,
    ),
    Moto(
      marcaModelo: 'Kymco Agility City 125',
      fuelTankLiters: 7.0,
      consumptionL100: 2.5,
    ),
    Moto(
      marcaModelo: 'Piaggio Liberty 125',
      fuelTankLiters: 6.0,
      consumptionL100: 2.3,
    ),
    Moto(
      marcaModelo: 'Sym Symphony 125',
      fuelTankLiters: 5.5,
      consumptionL100: 2.4,
    ),
    Moto(
      marcaModelo: 'Vespa Primavera 125',
      fuelTankLiters: 8.0,
      consumptionL100: 2.8,
    ),
    Moto(
      marcaModelo: 'Kawasaki J125',
      fuelTankLiters: 11.0,
      consumptionL100: 3.5,
    ),
    Moto(
      marcaModelo: 'Peugeot Pulsion 125',
      fuelTankLiters: 12.0,
      consumptionL100: 3.0,
    ),
  ];

  late Moto motoSeleccionada;

  MotoProvider() {
    motoSeleccionada = motos.first;
  }

  void canviarMoto(Moto moto) {
    motoSeleccionada = moto;
    notifyListeners();
  }
}
