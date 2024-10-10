class Calculadora {
  String textoPantalla = '';
  String operador = '';
  double primerNum = 0;
  double segundoNum = 0;

  void actualizarPantalla(String valor) {
    textoPantalla += valor; // Mantiene la expresión en la pantalla
  }

  void botonPresionado(String valor) {
    if (valor == '+' || valor == '-' || valor == '*' || valor == '/') {
      if (textoPantalla.isNotEmpty) {
        operador = valor;
        primerNum = double.tryParse(textoPantalla) ?? 0;
        textoPantalla += valor; // Agrega el operador a la pantalla
      }
    } else if (valor == '=') {
      segundoNum = double.tryParse(textoPantalla.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0; // Solo números
      resultado();
    } else if (valor == 'AC') {
      limpiar();
    } else if (valor == '⌫') {
      if (textoPantalla.isNotEmpty) {
        textoPantalla = textoPantalla.substring(0, textoPantalla.length - 1);
      }
    } else {
      actualizarPantalla(valor);
    }
  }

  void resultado() {
    double result = 0;

    if (operador.isEmpty || textoPantalla.isEmpty) return;

    segundoNum = double.tryParse(textoPantalla.split(RegExp(r'[+\-*/]')).last) ?? 0; // Obtiene el último número ingresado

    switch (operador) {
      case '+':
        result = primerNum + segundoNum;
        break;
      case '-':
        result = primerNum - segundoNum;
        break;
      case '*':
        result = primerNum * segundoNum;
        break;
      case '/':
        if (segundoNum != 0) {
          result = primerNum / segundoNum;
        } else {
          textoPantalla = 'Error'; // Manejo de error
          return;
        }
        break;
    }
    textoPantalla = result.toString();
  }

  void limpiar() {
    textoPantalla = '';
    operador = '';
    primerNum = 0;
    segundoNum = 0;
  }
}
