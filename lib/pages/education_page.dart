import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  final List<EducationItem> educationList = const [
    EducationItem(
      institution: 'Instituto IDAT',
      degree: 'Técnica en Desarrollo de Software',
      years: '2019 - 2021',
    ),
    EducationItem(
      institution: 'Platzi / Udemy',
      degree: 'Cursos en Flutter y UI/UX',
      years: '2021 - Actualidad',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Educación'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Formación Académica 🎓',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 20),
            ...educationList.map((edu) => _EducationCard(edu: edu)),
          ],
        ),
      ),
    );
  }
}

class EducationItem {
  final String institution;
  final String degree;
  final String years;

  const EducationItem({
    required this.institution,
    required this.degree,
    required this.years,
  });
}

class _EducationCard extends StatelessWidget {
  final EducationItem edu;

  const _EducationCard({required this.edu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.pink.shade50,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.school, color: Colors.pinkAccent, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    edu.institution,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    edu.degree,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    edu.years,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
