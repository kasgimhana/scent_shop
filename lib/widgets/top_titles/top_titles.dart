import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;

  const TopTitles({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(),
        if (title == "Login" || title == "Create Account")
          const SizedBox(
            height: 12,
          ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
