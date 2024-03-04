import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_state_provider.dart';

class Riverpod2StateProvider extends ConsumerWidget {
  const Riverpod2StateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msg = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: _buildAppBar(ref),
      body: Center(
        child: Text(
          msg.toString(),
          style: const TextStyle(
              fontSize: 64, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterStateProvider.notifier).state++;
          },
          child: const Icon(Icons.add)),
    );
  }

  _buildAppBar(WidgetRef ref) {
    return AppBar(
      title: const Text('StateProvider Example'),
      actions: [
        GestureDetector(
            onTap: () => ref.invalidate(counterStateProvider),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.refresh),
            ))
      ],
    );
  }
}
