import 'package:flutter/material.dart';
import 'package:myapp/screens/profile_screen/profile_screen.dart';
import 'package:myapp/widgets/bottom_navigation/bottom_navigation.dart';
import 'main_screen_content.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  final List<Widget> _screens = const [
    Placeholder(),
    Placeholder(),
    MainScreenContent(),
    Placeholder(),
    ProfileScreen(),
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
        decoration: _buildBackgroundGradient(),
        child: SafeArea(
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFBFC8EA),
          Color(0xFFD0ECF9),
          Color(0xFFF0FAFF),
          Color(0xFFF5FAFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}