import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}
class _Tab1ScreenState extends State<Tab1Screen> {
  int _whiteSeconds = 180;
  int _blackSeconds = 180;
  bool _whiteTurn = true;
  bool _running = false;
  int _moves = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Chess Clock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: AppTheme.secondaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Player 2 (Black)
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_running || !_whiteTurn) {
                  setState(() {
                    _running = true;
                    _whiteTurn = true;
                    _moves++;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: !_whiteTurn && _running ? AppTheme.primaryColor.withValues(alpha: 0.25) : AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: !_whiteTurn && _running ? AppTheme.primaryColor : Colors.white12, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('BLACK', style: TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      const SizedBox(height: 8),
                      Text('${_blackSeconds ~/ 60}:${(_blackSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Middle Controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => _running = !_running),
                  icon: Icon(_running ? Icons.pause : Icons.play_arrow),
                  label: Text(_running ? 'Pause' : 'Start'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, foregroundColor: Colors.white),
                ),
                Text('Moves: $_moves', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                OutlinedButton(
                  onPressed: () => setState(() {
                    _whiteSeconds = 180;
                    _blackSeconds = 180;
                    _running = false;
                    _moves = 0;
                  }),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
          // Player 1 (White)
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_running || _whiteTurn) {
                  setState(() {
                    _running = true;
                    _whiteTurn = false;
                    _moves++;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _whiteTurn && _running ? AppTheme.primaryColor.withValues(alpha: 0.25) : AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _whiteTurn && _running ? AppTheme.primaryColor : Colors.white12, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WHITE', style: TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      const SizedBox(height: 8),
                      Text('${_whiteSeconds ~/ 60}:${(_whiteSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

