import 'package:flutter/material.dart';

import 'package:calculadora/config/temas/app_temas.dart';
void main() {
  runApp(const AppLayout());
}

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black, // Fondo negro
            height: double.infinity, // Ocupa todo el alto
            width: double.infinity, // Ocupa todo el ancho
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los hijos
              children: [
                // Pantalla de la calculadora
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Align(
                      alignment: Alignment.bottomRight, // Alinea el texto a la derecha
                      child: Text(
                        "4-2", // Texto en la pantalla
                        style: TextStyle(fontSize: 65, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Botones de la calculadora
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 4, // 4 columnas de botones
                      crossAxisSpacing: 20, // Espacio entre columnas
                      mainAxisSpacing: 16, // Espacio entre filas
                      shrinkWrap: true, // Envuelve el contenido
                      children: List.generate(20, (index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: colors[index], // Color del botón
                            borderRadius: const BorderRadius.all(Radius.circular(255)), // Bordes redondeados
                          ),
                          child: Center(child: controllers[index]), // Centra el contenido del botón
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}