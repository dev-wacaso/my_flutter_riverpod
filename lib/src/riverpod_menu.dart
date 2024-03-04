import 'package:flutter/material.dart';
import 'package:my_riverpod_samples/src/screens/riverpod_1_provider.dart';

import 'screens/riverpod_2_state_provider.dart';
import 'screens/riverpod_3_state_notifier_provider.dart';
import 'screens/riverpod_4_future_provider.dart';

class RiverpodMenu extends StatelessWidget {
  const RiverpodMenu({super.key});

  static const providers = [
    ['Provider', Riverpod1Provider()],
    ['StateProvider', Riverpod2StateProvider()],
    ['StateNotifierProvider', Riverpod3StateNotifierProvider()],
    ['FutureProvider', Riverpod4FutureProvider()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Examples')),
      body: ListView.builder(
              itemCount: providers.length,
              itemBuilder: (_ctx, i) => ListTile(
      title: Text(providers[i][0] as String),
      onTap: () => Navigator.push(
        _ctx,
        MaterialPageRoute(
          builder: (context) => providers[i][1] as Widget,
        ),
      ),
              ),
            ),
    );
  }
}
