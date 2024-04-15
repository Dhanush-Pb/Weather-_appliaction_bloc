import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loadpage extends StatelessWidget {
  const Loadpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Lottie.asset(
                      'lib/Assets/Animation - 1713191328698.json',
                      width: 170)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'SkyCast',
                style: TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
