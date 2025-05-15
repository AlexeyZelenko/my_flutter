import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_navigation.dart';
import 'package:myapp/widgets/health_tracker.dart';
import 'package:myapp/widgets/courses_section.dart';
import 'package:myapp/widgets/spring_care_section.dart';
import 'package:myapp/widgets/conscious_care_guide.dart';
import 'package:myapp/widgets/recommended_products.dart';
import 'package:myapp/widgets/user_profile_header.dart';
import 'package:myapp/widgets/video_player_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UserProfileHeader(),
              const VideoPlayerSection(),
              const HealthTracker(),
              const CoursesSection(),
              const SpringCareSection(),
              const ConsciousCareGuide(),
              const RecommendedProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
