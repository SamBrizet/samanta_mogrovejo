import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/resume_home.dart'; // ✅
import 'pages/about_page.dart';
import 'pages/skills_page.dart';
import 'pages/experience_page.dart';
import 'pages/education_page.dart';
import 'pages/contact_page.dart';

void main() => runApp(MyResumeApp());

class MyResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samanta Brizet - CV',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ResumeHomePage(),
        '/about': (context) => AboutPage(),
        '/skills': (context) => SkillsPage(),
        '/experience': (context) => ExperiencePage(),
        '/education': (context) => EducationPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
