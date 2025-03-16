import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';

class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets(
      {super.key, required this.errorText, required this.retryFunction});

  final String errorText;
  final Function retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            MyAppIcons.iconError,
            size: 50,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            "Error: $errorText",
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            child: const Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
