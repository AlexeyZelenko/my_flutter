import 'package:flutter/material.dart';
import 'package:myapp/widgets/profile/menu_items_widget.dart';
import 'package:myapp/widgets/profile/profile_header_widget.dart';
import 'package:myapp/widgets/profile/stats_row_widget.dart';
import 'package:myapp/widgets/profile/diagnostics/widgets/diagnostics_result_widget.dart';
import 'package:myapp/widgets/profile/hygiene/widgets/hygiene_result_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
            stops: [0.0, 0.2336, 0.4136, 0.6282, 1.6592],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const ProfileHeaderWidget(),
                    const StatsRowWidget(),
                    const SizedBox(height: 16),
                    const DiagnosticsResultWidget(),
                    const HygieneLevelWidget(),
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