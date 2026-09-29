import 'dart:math';

import 'package:ball_shuffling/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? imagePath;

  String btnBallPress() {
    Random random = Random();
    final ballValue = random.nextInt(5) + 1;
    return 'ball$ballValue.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          widget.title,
          style: GoogleFonts.acme(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ball",
                style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 42, fontWeight: FontWeight.w700)),
              ),

              // Image.asset(imagePath),
              if (imagePath != null) ...{
                const SizedBox(
                  height: 35,
                ),
                Image.asset(
                  imagePath!,
                ),
              },

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    imagePath = "assets/images/${btnBallPress()}";
                    print(imagePath);
                  });
                },
                child: Text(
                  "Press me",
                  style: GoogleFonts.acme(textStyle: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
