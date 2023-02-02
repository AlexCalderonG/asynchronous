import 'package:flutter/material.dart';
import 'services/mockapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cargandoCoche = "---";
  String cargandoPersona = "---";
  int contadorAvion = 0;
  int contadorCoche = 0;
  int contadorPersona = 0;
  double _tamanoAvion = 0;
  double _tamanoCoche = 0;
  double _tamanoPersona = 0;
  int _velocidadAnimacionAvion = 1;
  int _velocidadAnimacionCoche = 3;
  int _velocidadAnimacionPersona = 10;

  // Función que actualiza el contador del avión
  Future<void> actualizarAvion() async {
    setState(() {
      _velocidadAnimacionAvion = 1;
      _tamanoAvion = 200;
    });
    int cont = await MockApi().getFerrariInteger();
    setState(() {
      contadorAvion = cont;
      _velocidadAnimacionAvion = 0;
      _tamanoAvion = 0;
    });
  }

  // Función que actualiza el contador del coche
  Future<void> actualizarCoche() async {
    setState(() {
      _velocidadAnimacionCoche = 3;
      _tamanoCoche = 200;
    });
    int cont = await MockApi().getHyundaiInteger();
    setState(() {
      contadorCoche = cont;
      _velocidadAnimacionCoche = 0;
      _tamanoCoche = 0;
    });
  }

  // Función que actualiza el contador de la persona
  Future<void> actualizarPersona() async {
    setState(() {
      _velocidadAnimacionPersona = 10;
      _tamanoPersona = 200;
    });
    int cont = await MockApi().getFisherPriceInteger();
    setState(() {
      contadorPersona = cont;
      _velocidadAnimacionPersona = 0;
      _tamanoPersona = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Asynchronous calls'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green),
                  onPressed: () {
                    actualizarAvion();
                  },
                  child: const Icon(Icons.airplanemode_active)),
              AnimatedContainer(
                  duration: Duration(seconds: _velocidadAnimacionAvion),
                  color: Colors.green,
                  height: 10,
                  width: _tamanoAvion),
              Text("$contadorAvion",
                  style: const TextStyle(fontSize: 40, color: Colors.green)),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.orange),
                  onPressed: () {
                    actualizarCoche();
                  },
                  child: const Icon(Icons.directions_car)),
              AnimatedContainer(
                  duration: Duration(seconds: _velocidadAnimacionCoche),
                  color: Colors.orange,
                  height: 10,
                  width: _tamanoCoche),
              Text("$contadorCoche",
                  style: const TextStyle(fontSize: 40, color: Colors.orange)),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.red),
                  onPressed: () {
                    actualizarPersona();
                  },
                  child: const Icon(Icons.directions_run)),
              AnimatedContainer(
                  duration: Duration(seconds: _velocidadAnimacionPersona),
                  color: Colors.red,
                  height: 10,
                  width: _tamanoPersona),
              Text("$contadorPersona",
                  style: const TextStyle(fontSize: 40, color: Colors.red)),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
