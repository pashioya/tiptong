import 'package:flutter/material.dart';

class HintKeyboard extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode; // Add FocusNode to manage focus

  const HintKeyboard({
    super.key,
    required this.controller,
    required this.focusNode, // Pass FocusNode from parent
  });

  @override
  State<HintKeyboard> createState() => _HintKeyboardState();
}

class _HintKeyboardState extends State<HintKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Row(
            children: [
              _buildButton(const Icon(Icons.first_page), "test"),
              _buildButton(const Icon(Icons.airplay), "one"),
              _buildButton(const Icon(Icons.arrow_back), "two"),
            ],
          ),
          Row(
            children: [
              _buildButton(const Icon(Icons.scatter_plot_outlined), "three"),
              _buildButton(const Icon(Icons.gamepad), "test1"),
              _buildButton(const Icon(Icons.icecream), "test2"),
            ],
          ),
          Row(
            children: [
              _buildButton(const Icon(Icons.zoom_in_map), "test3"),
              _buildButton(const Icon(Icons.battery_full), "test4"),
              _buildButton(const Icon(Icons.javascript), "test6"),
            ],
          ),
          Row(
            children: [
              _buildButton(const Icon(Icons.keyboard), "keyboard",
                  isKeyboard: true), // Adjust for the keyboard button
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(Icon icon, String input, {bool isKeyboard = false}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _input(input, isKeyboard),
        child: icon,
      ),
    );
  }

  // Input handling
  void _input(String text, bool isKeyboard) {
    if (isKeyboard) {
      // Focus on the text field and show the system keyboard
      FocusScope.of(context).requestFocus(widget.focusNode);
    } else {
      // Add the text to the text field
      final value = widget.controller.text + text;
      widget.controller.text = value;
      widget.controller.selection = TextSelection.fromPosition(
        TextPosition(offset: value.length),
      ); // Move the cursor to the end
    }
  }
}
