import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final presets = [
      ('Bullet 1+0', 'Hyper-fast reflex play', '1 min'),
      ('Blitz 3+0', 'Standard rapid online blitz', '3 min'),
      ('Blitz 3+2', 'Fischer increment (+2s/move)', '3 min'),
      ('Rapid 10+0', 'Tactical deep calculation', '10 min'),
      ('Classical 30+0', 'Tournament standard timing', '30 min'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Presets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: presets.map((p) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppTheme.primaryColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.flash_on, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.$1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(p.$2, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                  ],
                ),
              ),
              Text(p.$3, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        )).toList(),
      ),
    );
  }
}

