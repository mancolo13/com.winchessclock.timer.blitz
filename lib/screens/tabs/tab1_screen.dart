import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  bool _whiteTurn = true;
  bool _running = false;
  int _whiteSec = 180;
  int _blackSec = 174;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • ChessBlitz Clock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppTheme.primaryColor),
            onPressed: () => setState(() {
              _whiteSec = 180;
              _blackSec = 180;
              _running = false;
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          // Top Half: Black Player
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_whiteTurn && _running) {
                  setState(() => _whiteTurn = true);
                }
              },
              child: Container(
                width: double.infinity,
                color: !_whiteTurn ? AppTheme.primaryColor.withValues(alpha: 0.35) : AppTheme.surfaceColor,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('BLACK (PLAYER 2)', style: TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(
                        '${_blackSec ~/ 60}:${(_blackSec % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Middle Controls
          Container(
            height: 60,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(_running ? Icons.pause : Icons.play_arrow, color: AppTheme.secondaryColor, size: 32),
                  onPressed: () => setState(() => _running = !_running),
                ),
                Text('BLITZ 3+2 • MOVE #18', style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 13)),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white60),
                  onPressed: () => RoutingService.openRegistrationUrl(),
                ),
              ],
            ),
          ),
          // Bottom Half: White Player
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_whiteTurn && _running) {
                  setState(() => _whiteTurn = false);
                }
              },
              child: Container(
                width: double.infinity,
                color: _whiteTurn ? AppTheme.primaryColor.withValues(alpha: 0.35) : AppTheme.surfaceColor,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${_whiteSec ~/ 60}:${(_whiteSec % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: AppTheme.secondaryColor),
                      ),
                      const SizedBox(height: 8),
                      const Text('WHITE (PLAYER 1)', style: TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
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

