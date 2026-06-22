import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Counter value = $counterState",
          style: const TextStyle(fontSize: 23),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          // Bouton Moins (-)
          FloatingActionButton.small(
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8), 
          
          // Bouton Reset (Refresh)
          FloatingActionButton.small(
            onPressed: () {
              // Remet à zéro
              ref.read(counterProvider.notifier).state = 0;
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
          
          // Bouton Plus (+)
          FloatingActionButton.small(
            onPressed: () {
              // Augmente la valeur de 1
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}