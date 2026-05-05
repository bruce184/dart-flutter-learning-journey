import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/widgets/panel_card.dart';

class PanelsSection extends StatelessWidget {
  const PanelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 116,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: PanelCard(
              title: 'Main Area',
              subtitle: 'flex: 2',
              color: Color(0xFFE0F2F1),
              icon: Icons.dashboard,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: PanelCard(
              title: 'Side',
              subtitle: 'flex: 1',
              color: Color(0xFFFFF3E0),
              icon: Icons.tune,
            ),
          ),
        ],
      ),
    );
  }
}
