import 'package:flutter/material.dart';
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

  void incrementCounter() {
    setState(() {
      if (currentProgress < totalProgress) {
        currentProgress++; // Increment progress until it reaches the total
      }
    });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextFormField(
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // incrementCounter();
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.help),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
