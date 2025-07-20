import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const ThemeSwitcher({
    required this.isDarkMode,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.light_mode, color: isDarkMode ? Colors.white54 : Colors.amber),
        Switch(
          value: isDarkMode,
          onChanged: onChanged,
          activeColor: Colors.amber,
        ),
        Icon(Icons.dark_mode, color: isDarkMode ? Colors.amber : Colors.white54),
      ],
    );
  }
}