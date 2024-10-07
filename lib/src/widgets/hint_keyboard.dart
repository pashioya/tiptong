import 'package:flutter/material.dart';

class HintKeyboard extends StatelessWidget {
  const HintKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('1'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('2'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('3'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('4'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('5'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('6'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('7'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('8'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('9'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.keyboard),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
