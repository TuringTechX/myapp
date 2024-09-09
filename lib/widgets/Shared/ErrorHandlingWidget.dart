// lib/widgets/Shared/ErrorHandlingWidget.dart
import 'package:flutter/material.dart';

class ErrorHandlingWidget extends StatelessWidget {
  final Object error;
  final VoidCallback retryCallback;

  const ErrorHandlingWidget(
      {super.key, required this.error, required this.retryCallback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: $error'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: retryCallback,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
