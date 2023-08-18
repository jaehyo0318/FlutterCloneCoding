import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _Appstate();
}

class _Appstate extends State<App> {
  int counter = 0;
  List<int> nums = [];

  void onClicked() {
    setState(() {
      counter = counter + 1;
      nums.add(nums.length + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Click Count',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
            for (var n in nums)
              Text(
                '$n',
                style: const TextStyle(fontSize: 30, color: Colors.red),
              ),
            IconButton(
              iconSize: 30,
              onPressed: onClicked,
              icon: const Icon(Icons.add_box_rounded),
            )
          ]),
        ),
      ),
    );
  }
}
