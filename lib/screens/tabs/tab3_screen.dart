import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Move Log')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(8, (i) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Move ${i + 1}', style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              Text('W: 1.8s', style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
              Text('B: 2.3s', style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        )),
      ),
    );
  }
}

