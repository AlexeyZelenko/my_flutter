import 'package:flutter/material.dart';
import 'package:myapp/widgets/main/user_profile_header.dart';
import 'package:myapp/widgets/main/video_player_section/video_player_section.dart';
import 'package:myapp/widgets/main/appointment_doctor.dart';
import 'package:myapp/widgets/main/helper_section.dart';
import 'package:myapp/widgets/main/conscious_care_guide.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({super.key});

  void _onDiagnosticsButtonPressed() {
    print('Кнопка "Діагностика" натиснута!');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfileHeader(
            onDiagnosticsPressed: _onDiagnosticsButtonPressed,
          ),
          const VideoPlayerSection(),
          const WideCardSection(),
          const HelperMainPage(),
          const ConsciousCareGuide(),
        ],
      ),
    );
  }
}