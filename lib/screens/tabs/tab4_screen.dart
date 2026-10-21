import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildToggle('Mechanical Click Sound', true),
          _buildToggle('Vibrate on Low Time (10s)', true),
          _buildToggle('Show Centiseconds Under 20s', true),
          _buildToggle('Fischer Increment Warning', false),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => RoutingService.openRegistrationUrl(),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, padding: const EdgeInsets.all(16)),
            child: const Text('Tournament Pro Mode →', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
  Widget _buildToggle(String title, bool val) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Switch(value: val, onChanged: (_) {}, activeTrackColor: AppTheme.primaryColor),
        ],
      ),
    );
  }
}

