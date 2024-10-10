import 'package:flutter/material.dart';
// import 'package:flutter_application_contador/presentacion/pantallas/contador_pantallas.dart';
import 'package:flutter_application_contador/presentacion/pantallas/contador_pantallas_funciones.dart';

import 'config/tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorPersonalizado,
      ),
      home: const ContadorPantallasFunciones(),
    );
      
}
}