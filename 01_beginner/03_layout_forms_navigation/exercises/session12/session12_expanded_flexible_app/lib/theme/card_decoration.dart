import 'package:flutter/material.dart';

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
    ],
  );
}
