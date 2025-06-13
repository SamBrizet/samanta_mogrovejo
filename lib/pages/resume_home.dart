// lib/pages/resume_home.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ResumeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Samanta Brizet'),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavButton(title: 'Acerca de mí', route: '/about'),
            _NavButton(title: 'Habilidades', route: '/skills'),
            _NavButton(title: 'Experiencia', route: '/experience'),
            _NavButton(title: 'Educación', route: '/education'),
            _NavButton(title: 'Contacto', route: '/contact'),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final String route;

  const _NavButton({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(title),
      ),
    );
  }
}
