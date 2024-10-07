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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
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
            icon: const Icon(Icons.settings),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/bear.jpeg', // Correctly reference the image asset
                width: 200, // You can set the size of the image here
                height: 200,
              ),
            ),
            const Text(
              'Welk dier wordt hier afgebeeld?',
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisSize: MainAxisSize.values[0],
                children: [
                  // Expanded widget makes sure TextFormField takes available space
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      print("Check button pressed");
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
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
          incrementCounter();
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.help),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
