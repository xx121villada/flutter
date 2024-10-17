import 'package:flutter/material.dart';

// const Color _colorPersonalizado =   Color(0xFF49149f);

// const List<Color> _colorTemas = [

//   _colorPersonalizado,
//   Colors.blue,
//   Colors.teal,
//   Colors.green,
//   Colors.yellow,
//   Colors.orange,
//   Colors.pink,

// ];

// class AppTema {
//   ThemeData theme(){
//     return ThemeData(
//       useMaterial3:true,
//       colorSchemeSeed: _colorTemas[3],
//     ); 
//   }
// }

class AppTema {
  final int index; // Cambié el nombre para mayor claridad

  AppTema(this.index);

  static const List<Color> _colorTemas = [
    Color(0xFF49149f),
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
  ];

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTemas[index], // Usa el índice proporcionado
    );
  }
}
