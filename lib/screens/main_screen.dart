import 'package:flutter/material.dart';
import 'package:myapp/screens/profile_screen.dart'; // Import the new profile screen
import 'package:myapp/widgets/bottom_navigation.dart';
import 'package:myapp/widgets/conscious_care_guide.dart';
import 'package:myapp/widgets/main/user_profile_header.dart';
import 'package:myapp/widgets/main/video_player_section.dart';
import 'package:myapp/widgets/main/helper_section.dart';
import 'package:myapp/widgets/main/appointment_doctor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // Default to 'Помощник' as active initially based on previous code

  // Placeholder for actual screen widgets, add ProfileScreen here
  static const List<Widget> _widgetOptions = <Widget>[
    // Replace with actual screens for Home, Study, Helper, Shop
    Center(child: Text('Главная')), // Placeholder for Home
    Center(child: Text('Обучение')), // Placeholder for Study
    SingleChildScrollView( // Original content of MainScreen for 'Помощник'
      child: Column(
        children: [
          UserProfileHeader(),
          VideoPlayerSection(),
          WideCardSection(),
          HelperMainPage(),
          ConsciousCareGuide(),
        ],
      ),
    ),
    Center(child: Text('Магазин')), // Placeholder for Shop
    ProfileScreen(), // Add ProfileScreen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFBFC8EA), // #BFC8EA
              Color(0xFFD0ECF9), // #D0ECF9
              Color(0xFFF0FAFF), // #F0FAFF
              Color(0xFFF5FAFF), // #F5FAFF
              Color(0xFFFFFFFF), // #FFFFFF
              Color(0xFFFFFFFF), // #FFFFFF
            ],
          ),
        ),
        child: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        // Rebuild BottomNavigation with onTap and isActive logic
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                svgIconPath: 'assets/icons/home.svg',
                label: 'Главная',
                isActive: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
              NavItem(
                svgIconPath: 'assets/icons/study.svg',
                label: 'Обучение',
                isActive: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
              ),
              NavItem(
                svgIconPath: 'assets/icons/vector.svg',
                label: 'Помощник',
                isActive: _selectedIndex == 2,
                onTap: () => _onItemTapped(2),
              ),
              NavItem(
                svgIconPath: 'assets/icons/shopping.svg',
                label: 'Магазин',
                isActive: _selectedIndex == 3,
                onTap: () => _onItemTapped(3),
              ),
              NavItem(
                svgIconPath: 'assets/icons/user.svg',
                label: 'Профиль',
                isActive: _selectedIndex == 4,
                onTap: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}