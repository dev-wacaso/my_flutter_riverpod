import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/message_provider.dart';

class Riverpod1Provider extends ConsumerWidget {
  const Riverpod1Provider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msg = ref.watch(messageProvider);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Text(
          msg,
          style: const TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Provider Example'),
    );
  }
}
