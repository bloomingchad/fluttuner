import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

Future<void> setPlayer(AudioPlayer player) async {
  final duration = await player.setUrl(           // Load a URL
      'https://nl.ah.fm/mobile');                 // Schemes: (https: | file: | asset: )
}

Future<void> startPlayingPlayer(AudioPlayer player) async {
  player.play();
}

Future<void> pausePlayer(AudioPlayer player) async {
  player.pause();
}

Future<void> stopPlayer(AudioPlayer player) async {
  player.stop();
}

void main() {
  runApp(const MyApp());
  stopPlayer(player);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluttuner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(title: 'fluttuner'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30), // Add some space between the counter and the box
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7B600),
                  /*border: Border.all(
                  width: 8,
                ),*/
                borderRadius: BorderRadius.circular(24),
              ),
              width: 350, // Width of the rectangle
              height: 150, // Height of the rectangle
              //color: Colors.redAccent, // Background color of the rectangle
              alignment: Alignment.topLeft, // Align the text to the center
              child: GestureDetector(
                onTap: () {
                  // Handle the click event here
                  //print('Radio Station #1 clicked!');
                  setPlayer(player);
                  startPlayingPlayer(player);
                },
                child: const Center(
                  child: const Text(
                  textAlign: TextAlign.center,
                  'Radio Station #1',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 25, // Text size

                    fontWeight: FontWeight.normal, // Text weight
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
