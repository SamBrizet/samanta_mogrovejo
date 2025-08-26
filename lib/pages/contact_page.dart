import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_header.dart';



class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, dynamic>> contactMethods = [
    {
      'title': 'Email',
      'value': 'mogrovejosamanta@gmail.com',
      'icon': Icons.email_outlined,
      'color': Color(0xFF3B82F6),
      'action': 'mailto:mogrovejosamanta@gmail.com',
    },
    {
      'title': 'Teléfono',
      'value': '+51 960 501 484',
      'icon': Icons.phone_outlined,
      'color': Color(0xFF10B981),
      'action': 'tel:+51960501484',
    },
    {
      'title': 'LinkedIn',
      'value': '/in/samanta-brizet-mogrovejo-tucto-b57658285/',
      'icon': Icons.business_center_outlined,
      'color': Color(0xFF0077B5),
      'action': 'https://linkedin.com/in/samanta-brizet-mogrovejo-tucto-b57658285/',
    },
    {
      'title': 'GitHub',
      'value': 'github.com/SamBrizet',
      'icon': Icons.code_outlined,
      'color': Color(0xFF333333),
      'action': 'https://github.com/SamBrizet',
    },
    {
      'title': 'Ubicación',
      'value': 'Lima, Perú',
      'icon': Icons.location_on_outlined,
      'color': Color(0xFFFF6B6B),
      'action': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

     _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   void _handleContactTap(String? action) async {
    if (action == null) return;
    if (action.startsWith('mailto:') || action.startsWith('tel:') || action.startsWith('https://')) {
      final Uri url = Uri.parse(action);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
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
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
               CustomAppHeader(
              title: 'Contacto',
              subtitle: 'Ponte en contacto conmigo a través de los siguientes métodos:',
            ),
              Expanded(
                child:  FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            itemCount: contactMethods.length,
            separatorBuilder: (_, __) => SizedBox(height: 20),
            itemBuilder: (context, index) {
              final method = contactMethods[index];
              return InkWell(
                onTap: method['action'] != null
                    ? () => _handleContactTap(method['action'])
                    : null,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.18),
                      width: 1,
                    ),
                  ),
                    child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: method['color'].withOpacity(0.18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          method['icon'],
                          color: method['color'],
                          size: 26,
                        ),
                      ),
                      SizedBox(width: 18),
                     // ...existing code...
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              method['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              method['value'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (method['action'] != null)
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white.withOpacity(0.7),
                          size: 16,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF764ba2),
    );
  }
    }

            
      
      
  
                    
                    




