import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  ButtonComponent({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }
}
