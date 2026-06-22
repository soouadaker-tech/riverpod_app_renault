import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
int step(Ref ref) {
  return 4;
}

@riverpod
class CounterNotifier extends _$CounterNotifier { 
  @override
  int build() {
    return 10; 
  }

  void increment() {
    final step = ref.read(stepProvider);
    state = state + step;
  }

  void decrement() {
    final step = ref.read(stepProvider);
    state = state - step;
  }
}

