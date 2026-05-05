import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/theme/card_decoration.dart';

class FlexibleMessage extends StatelessWidget {
  const FlexibleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: cardDecoration(),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.teal),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              'Flexible lets this message use available space without forcing it to fill every pixel.',
            ),
          ),
        ],
      ),
    );
  }
}
