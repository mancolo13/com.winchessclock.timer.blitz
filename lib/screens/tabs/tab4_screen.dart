import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Match History')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _matchTile('White won by checkmate', '38 moves • Blitz 3+2'),
          _matchTile('Black won on time (Flag fall)', '44 moves • Bullet 1+0'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => RoutingService.openRegistrationUrl(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('Unlock FIDE Arbiter Dual Delay Modes', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _matchTile(String res, String det) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(res, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(det, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}

