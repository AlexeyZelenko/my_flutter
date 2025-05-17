import 'package:flutter/material.dart';
import 'package:myapp/widgets/profile/menu_items_widget.dart';
import 'package:myapp/widgets/profile/profile_header/profile_header.dart';
import 'package:myapp/widgets/profile/stats_row_widget.dart';
import 'package:myapp/widgets/profile/diagnostics/widgets/diagnostics_result_widget.dart';
import 'package:myapp/widgets/profile/hygiene/widgets/hygiene_result_widget.dart';
// import 'package:myapp/widgets/profile/task_cards/task_cards_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Зробіть фон Scaffold прозорим
      body: Container(
        decoration: const BoxDecoration(
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
            stops: [0.0, 0.2336, 0.4136, 0.6282, 1.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    ProfileHeaderWidget(
                      userName: 'ЕКАТЕРИНА',
                      score: '8/10',
                      starsCount: '25',
                      avatarImage: const AssetImage('assets/images/avatar.png'),
                    ),
                    const StatsRowWidget(),
                    const SizedBox(height: 16),
                    const DiagnosticsResultWidget(),
                    const HygieneLevelWidget(),
                    // const TaskCardsSectionWidget(),
                    const MenuItemsWidget(),
                    const SizedBox(height: 20),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}