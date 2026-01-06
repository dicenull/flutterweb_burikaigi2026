import 'package:flutter/material.dart';

/// カウンターアプリのデモWidget
///
/// flutter_demo_slide.dart と riverpod_hooks_demo_slide.dart で共通使用
class CounterDemo extends StatefulWidget {
  const CounterDemo({super.key});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32.0,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
