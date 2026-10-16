import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Delay & Increment Mode')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fischer Increment (+2s per move)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 6),
                Text('Time is immediately added to the player clock upon releasing the clock face.', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

