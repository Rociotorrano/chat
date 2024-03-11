import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C114D);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'colors must be between 0 and ${_colorThemes.length}'); // esto es para que no se ponga un numero mayor a la cantidad de colores que hay y para que cuando salga un cartel rojo de error en la pantalla aparezca el mensaje y sepa donde etsa el error!

  ThemeData theme() {
    // Esto es por colores de defecto de material 3 y los numeros son los colores que puse mas arriba
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness
      //     .dark); // esto es para ponerlo en modo oscuro
    );
  }
}
