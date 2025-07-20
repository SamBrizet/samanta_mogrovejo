import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/resume_home.dart'; 
import 'pages/about_page.dart';
import 'pages/skills_page.dart';
import 'pages/experience_page.dart';
import 'pages/education_page.dart';
import 'pages/contact_page.dart';
import 'pages/my_widgets_page.dart';

void main() => runApp(MyResumeApp());

class MyResumeApp extends StatefulWidget {
  @override
  State<MyResumeApp> createState() => _MyResumeAppState();
}

class _MyResumeAppState extends State<MyResumeApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samanta Brizet - CV',
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ResumeHomePage(),
        '/about': (context) => AboutScreen(),
        '/skills': (context) => SkillsScreen(),
        '/experience': (context) => ExperienceScreen(),
        '/education': (context) => EducationScreen(),
        '/contact': (context) => ContactScreen(),
        // Pasa el estado y el callback solo a MyWidgetsPage
        '/mywidgets': (context) => MyWidgetsPage(
              isDarkMode: isDarkMode,
              onThemeChanged: toggleTheme,
            ),
      },
    );
  }
}