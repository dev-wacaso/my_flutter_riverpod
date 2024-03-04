import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>((ref) {
  return CounterStateNotifier(1);
});

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier(int init) : super(init);

  void up() {
    state++;
  }

  void down() {
    state--;
  }
}
