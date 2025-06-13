import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Acerca de mí'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Imagen de perfil
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/samanta.jpg'),
            ),
            const SizedBox(height: 20),

            // Nombre
            const Text(
              'Samanta Brizet Mogrovejo Tucto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Descripción
            const Text(
              'Soy desarrolladora Flutter con 3 años de experiencia creando '
              'interfaces bonitas, intuitivas y responsivas. Me apasiona el diseño '
              'y la tecnología, y disfruto convertir ideas en experiencias visuales fluidas. '
              'Trabajo con amor en cada línea de código 💖.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Detalles adicionales
            _InfoRow(label: 'Edad', value: '27 años'),
            _InfoRow(label: 'Nacionalidad', value: 'Peruana'),
            _InfoRow(label: 'Rol', value: 'Frontend Developer (Flutter)'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
