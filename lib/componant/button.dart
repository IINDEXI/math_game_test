import 'package:flutter/material.dart';
import '../screen/AddandSubtract.dart';
import '../screen/dividescreen.dart';
import '../screen/multiplyscreen.dart';

class button1 extends StatelessWidget {
  const button1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          child: const Text('บททดสอบการบวกลบเลข', style: TextStyle(fontSize: 24.0),),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddandSubtract()),
            );
          },
        );
  }
}

class button2 extends StatelessWidget {
  const button2({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          child: const Text('บททดสอบการคูณเลข', style: TextStyle(fontSize: 24.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const multiplyscreen()),
            );
          },
        );
  }
}

class button3 extends StatelessWidget {
  const button3({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          child: const Text('บททดสอบการหารเลข', style: TextStyle(fontSize: 24.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const dividescreen()),
            );
          },
        );
  }
}