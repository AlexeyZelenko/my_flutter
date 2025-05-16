import 'package:flutter/material.dart';
import 'package:myapp/widgets/main/user_profile_header.dart';
import 'package:myapp/widgets/main/video_player_section.dart';
import 'package:myapp/widgets/main/appointment_doctor.dart';
import 'package:myapp/widgets/main/helper_section.dart';
import 'package:myapp/widgets/conscious_care_guide.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          UserProfileHeader(),
          VideoPlayerSection(),
          WideCardSection(),
          HelperMainPage(),
          ConsciousCareGuide(),
        ],
      ),
    );
  }
}