import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/widgets/flexible_message.dart';
import 'package:session12_expanded_flexible_app/widgets/panels_section.dart';
import 'package:session12_expanded_flexible_app/widgets/profile_section.dart';
import 'package:session12_expanded_flexible_app/widgets/remaining_space_demo.dart';
import 'package:session12_expanded_flexible_app/widgets/stats_section.dart';

class Session12HomePage extends StatelessWidget {
  const Session12HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session 12 Expanded Flexible'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileSection(),
              SizedBox(height: 16),
              StatsSection(),
              SizedBox(height: 16),
              PanelsSection(),
              SizedBox(height: 16),
              FlexibleMessage(),
              SizedBox(height: 16),
              Expanded(child: RemainingSpaceDemo()),
            ],
          ),
        ),
      ),
    );
  }
}
