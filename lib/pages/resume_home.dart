import 'package:flutter/material.dart';

class ResumeHomePage extends StatefulWidget {
  @override
  ResumeHomePageState createState() => ResumeHomePageState();
}

class ResumeHomePageState extends State<ResumeHomePage> 
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                'Samanta Brizet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileSection(),
            SizedBox(height: 60),
            _buildMenuItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.1),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Flutter Developer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Creando experiencias digitales increíbles',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems() {
    final menuItems = [
      {'title': 'Acerca de mí', 'icon': Icons.person_outline, 'route': '/about'},
      {'title': 'Habilidades', 'icon': Icons.code, 'route': '/skills'},
      {'title': 'Experiencia', 'icon': Icons.work_outline, 'route': '/experience'},
      {'title': 'Educación', 'icon': Icons.school_outlined, 'route': '/education'},
      {'title': 'Contacto', 'icon': Icons.email_outlined, 'route': '/contact'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: menuItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;
          
          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 100)),
            curve: Curves.easeOutBack,
            margin: EdgeInsets.only(bottom: 16),
            child: _buildMenuItem(
              title: item['title'],
              icon: item['icon'],
              onTap: () {
                 Navigator.pushNamed(context, item['route']);
              },
              delay: index * 200,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    required int delay,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + delay),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.7),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}