import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_samples/src/providers/counter_state_notifier_provider.dart';

class Riverpod3StateNotifierProvider extends ConsumerWidget {
  const Riverpod3StateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msg = ref.watch(counterStateNotifierProvider);
    return Scaffold(
      appBar: _buildAppBar(ref),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 115),
              Text(
                msg.toString(),
                style: const TextStyle(
                    fontSize: 96,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _createStyledButton(
                    'Down',
                    () {
                      ref.read(counterStateNotifierProvider.notifier).down();
                    },
                  ),
                  _createStyledButton(
                    'Reset',
                    () {
                        ref.refresh(counterStateNotifierProvider);
                      },
                  ),
                  _createStyledButton(
                    'Up',
                    () {
                        ref.read(counterStateNotifierProvider.notifier).up();
                      },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(WidgetRef ref) {
    return AppBar(
      title: const Text('StateProvider Example'),
      actions: [
        GestureDetector(
            onTap: () => ref.invalidate(counterStateNotifierProvider),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.refresh),
            ))
      ],
    );
  }

  _createStyledButton(
    String text,
    void Function() onPressed,
  ) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shadowColor: MaterialStateProperty.all<Color>(Colors.red),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 10;
            return 5; // default elevation
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.orange, fontSize: 18,)),
    );
  }
}
