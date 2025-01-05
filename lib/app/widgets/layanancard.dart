import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/theme.dart';

class MyLayananCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;
  final VoidCallback onTap;
  const MyLayananCard({
    required this.icon,
    required this.desc,
    required this.title,
    required this.onTap,
  });

  @override
  _MyLayananCardState createState() => _MyLayananCardState();
}

class _MyLayananCardState extends State<MyLayananCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: screenWidth > 1000 ? screenWidth * 0.25 : screenWidth * 0.91,
          decoration: BoxDecoration(
            color: isHovered ? secondaryColors : thirdColors,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Icon(
                widget.icon,
                size: 50,
                color: isHovered ? Colors.white : Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLayananCardMenu extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  const MyLayananCardMenu({
    required this.icon,
    required this.title,
    required this.ontap,
  });
  

  @override
  _MyLayananCardMenuState createState() => _MyLayananCardMenuState();
}

class _MyLayananCardMenuState extends State<MyLayananCardMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return GestureDetector(
      onTap: widget.ontap,
        
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: screenWidth > 1000 ? screenWidth * 0.1 : screenWidth * 0.27,
          height: screenWidth > 1000 ? screenWidth * 0.1 : screenWidth * 0.27,
          decoration: BoxDecoration(
            color: isHovered ? secondaryColors : thirdColors,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: screenWidth > 1000 ? 50 : 35,
                color: isHovered ? Colors.white : Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth > 1000 ? 16 : 13,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
