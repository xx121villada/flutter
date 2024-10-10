// import 'package:flutter/material.dart';

// import 'package:calculadora/config/temas/app_temas.dart';
// void main() {
//   runApp(const AppLayout());
// }

// class AppLayout extends StatelessWidget {
//   const AppLayout({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Container(
//             color: Colors.black, // Fondo negro
//             height: double.infinity, // Ocupa todo el alto
//             width: double.infinity, // Ocupa todo el ancho
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los hijos
//               children: [
//                 // Pantalla de la calculadora
//                 Expanded(
//                   flex: 4,
//                   child: Container(
//                     color: Colors.black,
//                     width: double.infinity,
//                     height: double.infinity,
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: const Align(
//                       alignment: Alignment.bottomRight, // Alinea el texto a la derecha
//                       child: Text(
//                         "4-2", // Texto en la pantalla
//                         style: TextStyle(fontSize: 65, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Botones de la calculadora
//                 Expanded(
//                   flex: 7,
//                   child: Container(
//                     color: Colors.black,
//                     padding: const EdgeInsets.all(10),
//                     child: GridView.count(
//                       crossAxisCount: 4, // 4 columnas de botones
//                       crossAxisSpacing: 20, // Espacio entre columnas
//                       mainAxisSpacing: 16, // Espacio entre filas
//                       shrinkWrap: true, // Envuelve el contenido
//                       children: List.generate(20, (index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             color: colors[index], // Color del botón
//                             borderRadius: const BorderRadius.all(Radius.circular(255)), // Bordes redondeados
//                           ),
//                           child: Center(child: controllers[index]), // Centra el contenido del botón
//                         );
//                       }),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const AppLayout());
}

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  String displayText = ''; // Texto que se muestra en la pantalla
  String operator = ''; // Almacena el operador seleccionado
  double firstOperand = 0; // Primer número
  double secondOperand = 0; // Segundo número

  // Función para actualizar la pantalla
  void _updateDisplay(String value) {
    setState(() {
      displayText += value;
    });
  }

  // Función para manejar cuando se presiona un número o operador
  void _onButtonPressed(String value) {
    if (value == '+' || value == '-' || value == '*' || value == '/') {
      operator = value;
      firstOperand = double.tryParse(displayText) ?? 0;
      displayText = '';
    } else if (value == '=') {
      secondOperand = double.tryParse(displayText) ?? 0;
      _calculateResult();
    } else if (value == 'C') {
      _clear();
    } else {
      _updateDisplay(value);
    }
  }

  // Función para realizar el cálculo
  void _calculateResult() {
    double result = 0;

    switch (operator) {
      case '+':
        result = firstOperand + secondOperand;
        break;
      case '-':
        result = firstOperand - secondOperand;
        break;
      case '*':
        result = firstOperand * secondOperand;
        break;
      case '/':
        result = firstOperand / secondOperand;
        break;
    }

    setState(() {
      displayText = result.toString();
    });
  }

  // Función para limpiar la pantalla y resetear todo
  void _clear() {
    setState(() {
      displayText = '';
      operator = '';
      firstOperand = 0;
      secondOperand = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Botones de la calculadora
    List<String> buttons = [
      '7', '8', '9', '/',
      '4', '5', '6', '*',
      '1', '2', '3', '-',
      'C', '0', '=', '+',
    ];

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
                        displayText, // Texto en la pantalla
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
                      children: List.generate(buttons.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            _onButtonPressed(buttons[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800], // Color del botón
                              borderRadius: const BorderRadius.all(Radius.circular(255)), // Bordes redondeados
                            ),
                            child: Center(
                              child: Text(
                                buttons[index],
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
