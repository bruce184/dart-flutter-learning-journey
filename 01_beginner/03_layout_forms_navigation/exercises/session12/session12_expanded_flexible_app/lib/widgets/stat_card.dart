import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/theme/card_decoration.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: cardDecoration(),
      child: Column(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(child: Text(label)),
        ],
      ),
    );
  }
}
