import 'package:flutter/material.dart';
import 'package:myapp/widgets/profile/diagnostics_result_widget.dart';
import 'package:myapp/widgets/profile/hygiene_level_widget.dart';
import 'package:myapp/widgets/profile/menu_items_widget.dart';
import 'package:myapp/widgets/profile/profile_header_widget.dart';
import 'package:myapp/widgets/profile/stats_row_widget.dart';
import 'package:myapp/widgets/profile/task_cards_section_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'), // Title from the image
        backgroundColor: Colors.transparent, // Assuming a transparent app bar or part of the body gradient
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black54), // Placeholder back button
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F2FE), // Light blue - top part of the gradient from image
              Color(0xFFFFFFFF), // White - bottom part
            ],
            stops: [0.0, 0.5], // Adjust stops for gradient appearance
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjusted padding to match design better
            children: const [
              ProfileHeaderWidget(),
              StatsRowWidget(),
              SizedBox(height: 16), // Spacing between sections
              TaskCardsSectionWidget(),
              DiagnosticsResultWidget(),
              HygieneLevelWidget(),
              MenuItemsWidget(),
              SizedBox(height: 20), // Bottom padding
            ],
          ),
        ),
      ),
      // Assuming the bottom navigation is global and handled by a parent Scaffold or similar.
      // If specific to this screen, it would be added here.
      // bottomNavigationBar: BottomNavigation(), // Example if needed
    );
  }
}