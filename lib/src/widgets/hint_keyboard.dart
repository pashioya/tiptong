import 'package:flutter/material.dart';

class HintKeyboard extends StatefulWidget {
  final TextEditingController controller;

  const HintKeyboard({Key? key, required this.controller}) : super(key: key);

  @override
  State<HintKeyboard> createState() => _HintKeyboardState();
}

class _HintKeyboardState extends State<HintKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              children: [
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
              ],
            ),
            Row(
              children: [
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
              ],
            ),
            Row(
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
              ],
            ),
            Row(
              children: [
                _buildButton('keyboard',
                    isSpecial: true), // Adjust for the keyboard button
              ],
            ),
          ],
        ));
  }

  // Individual keys
  Widget _buildButton(String text, {bool isSpecial = false}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _input(text, isSpecial),
        child: Text(text),
      ),
    );
  }

  // Input handling
  void _input(String text, bool isSpecial) {
    // If it's the 'keyboard' button, you can manage focus here or handle keyboard hiding
    if (isSpecial) {
      FocusScope.of(context)
          .unfocus(); // Hide the keyboard or manage focus here
    } else {
      final value = widget.controller.text + text;
      widget.controller.text = value;
      widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: value.length)); // Move the cursor to the end
    }
  }
}
