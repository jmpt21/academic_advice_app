import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.lightBlueAccent,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = true})
      : assert(selectedColor >= 0,
  'Selected color must be equal or higher than 0'),
        assert(selectedColor < colorList.length,
        'Selected color must be equal or less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}