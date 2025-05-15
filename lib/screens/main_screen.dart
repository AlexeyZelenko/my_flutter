import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_navigation.dart';
import 'package:myapp/widgets/conscious_care_guide.dart';
import 'package:myapp/widgets/main/user_profile_header.dart';
import 'package:myapp/widgets/main/video_player_section.dart';
import 'package:myapp/widgets/main/helper_section.dart';
import 'package:myapp/widgets/main/appointment_doctor.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UserProfileHeader(),
                const VideoPlayerSection(),
                const WideCardSection(),
                const HelperMainPage(),
                const ConsciousCareGuide(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: const BottomNavigation(),
      ),
    );
  }
}