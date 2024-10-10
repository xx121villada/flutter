import 'package:flutter/material.dart';
import 'package:calculadora/config/temas/app_temas.dart';
import 'package:calculadora/config/funciones/funcion.dart';

void main() {
  runApp(const AppLayout());
}

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

    @override
    State <AppLayout> createState() => AppLayoutState();
  }
  class AppLayoutState extends State<AppLayout> {
    final Calculadora calculadora = Calculadora();

    void botonPresionado(String valor) {
      calculadora.botonPresionado(valor);
      setState(() {
        calculadora.textoPantalla;
      });
    }
  @override
  Widget build(BuildContext context) {
    botones; 

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
                    child: Align(
                      alignment: Alignment.bottomRight, // Alinea el texto a la derecha
                      child: Text(
                        calculadora.textoPantalla, // Texto en la pantalla
                        style: const TextStyle(fontSize: 65, color: Colors.white),
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
                      children: List.generate(botones.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            botonPresionado(botones[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey[800],
                              color: colors[index],
                              borderRadius: const BorderRadius.all(Radius.circular(255)), // Bordes redondeados
                            ),
                            child: Center(
                              child: Text(
                                botones[index],
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
