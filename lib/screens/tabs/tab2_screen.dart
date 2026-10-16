import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final presets = [
      {'name': 'Bullet 1m + 0s', 'desc': 'Ultra fast hyper-bullet'},
      {'name': 'Blitz 3m + 2s', 'desc': 'Standard FIDE tournament blitz'},
      {'name': 'Blitz 5m + 0s', 'desc': 'Classic club blitz'},
      {'name': 'Rapid 10m + 5s', 'desc': 'Casual rapid match with Fischer increment'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Win • Time Controls')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: presets.length,
        itemBuilder: (context, i) {
          final p = presets[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(p['desc']!, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => RoutingService.openRegistrationUrl(),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, foregroundColor: Colors.black),
                  child: const Text('Apply'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

