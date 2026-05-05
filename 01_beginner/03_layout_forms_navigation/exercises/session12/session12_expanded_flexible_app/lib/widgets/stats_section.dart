import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/widgets/stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: StatCard(value: '12', label: 'Lessons', icon: Icons.menu_book),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(value: '8', label: 'Practice', icon: Icons.edit_note),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            value: 'Flex',
            label: 'Focus',
            icon: Icons.view_column,
          ),
        ),
      ],
    );
  }
}
