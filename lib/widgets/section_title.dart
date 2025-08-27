import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
     final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
           color: colors.onPrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
