import 'package:flutter/material.dart';
import 'package:tiptong/src/widgets/hint_keyboard.dart';
import 'package:tiptong/src/widgets/progress-bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipTong',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent.shade700),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentProgress = 1; // Initialize with a default value
  int totalProgress = 20; // Initialize with a default value
  bool _isHintKeyboardVisible = false; // Tracks visibility of the hint keyboard
  TextEditingController textController = TextEditingController();
  late FocusNode _textFieldFocusNode; // To track focus on the text field

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode = FocusNode();

    // Add listener to the focus node to track when the text field gains or loses focus
    _textFieldFocusNode.addListener(() {
      if (_textFieldFocusNode.hasFocus) {
        setState(() {
          _isHintKeyboardVisible =
              false; // Hide the hint keyboard when the text field is focused
        });
      }
    });
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose(); // Dispose of the focus node
    textController.dispose();
    super.dispose();
  }

  void toggleHintKeyboard() {
    setState(() {
      _isHintKeyboardVisible = !_isHintKeyboardVisible;
    });
    // if the hint keyboard is visible, hide the system keyboard
    if (_isHintKeyboardVisible) {
      FocusScope.of(context).unfocus(); // Dismiss the system keyboard
    }
  }

  void openImageModal(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Image Modal',
      barrierColor: Colors.black54, // Background overlay
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/bear.jpeg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 60,
                left: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                  ),
                  child: const Icon(Icons.close, size: 30),
                  onPressed: () {
                    Navigator.pop(context); // Close the modal
                  },
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from bottom
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.table_chart_outlined),
          onPressed: () {
            print("Menu icon pressed");
          },
        ),
        title: ProgressWidget(
          currentProgress: currentProgress, // Updated to use state variables
          totalProgress: totalProgress, // Updated to use state variables
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book_rounded),
            onPressed: () {
              print("Settings icon pressed");
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  openImageModal(context); // Open the animated modal
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox.fromSize(
                    size: const Size(200, 200),
                    child: Image.asset(
                      'assets/images/bear.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welk dier wordt hier afgebeeld?',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextFormField(
                      focusNode: _textFieldFocusNode, // Attach focus node
                      controller: textController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Antwoord',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("Check button pressed");
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // The animated hint keyboard at the bottom
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isHintKeyboardVisible ? 0 : -300, // Push up or down
            left: 0,
            right: 0,
            child: HintKeyboard(
              controller: textController,
            ), // Your custom keyboard widget
          ),
          // The animated help button above the hint keyboard
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom:
                _isHintKeyboardVisible ? 250 : 16, // Moves above the keyboard
            left: MediaQuery.of(context).size.width / 2 -
                28, // Center horizontally
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                toggleHintKeyboard(); // Show/hide the hint keyboard
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.help),
            ),
          ),
        ],
      ),
    );
  }
}
