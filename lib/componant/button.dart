import 'package:flutter/material.dart';
import '../default/default.dart';
import '../screen/AddandSubtractscreen.dart';
import '../screen/dividescreen.dart';
import '../screen/multiplyscreen.dart';
import '../screen/pairscreen.dart';

class AddandSubtractbutton extends StatelessWidget {
  const AddandSubtractbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(background_button)),
        child: const Text(
          'บททดสอบการบวกลบเลข',
          style: TextStyle(fontSize: 24.0,color: fontblackcolor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddandSubtract()),
          );
        
        },
      ),
    );
  }
}

class multiplyscreenbutton extends StatelessWidget {
  const multiplyscreenbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(background_button)),
        child: const Text(
          'บททดสอบการคูณเลข',
          style: TextStyle(fontSize: 24.0,color: fontblackcolor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const multiplyscreen()),
          );
        },
      ),
    );
  }
}

class dividescreenbutton extends StatelessWidget {
  const dividescreenbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(background_button)),
        child: const Text(
          'บททดสอบการหารเลข',
          style: TextStyle(fontSize: 24.0,color: fontblackcolor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const dividescreen()),
          );
        },
      ),
    );
  }
}

class pairscreenbutton extends StatelessWidget {
  const pairscreenbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(background_button)),
        child: const Text(
          'บททดสอบการจับคู่',
          style: TextStyle(fontSize: 24.0,color: fontblackcolor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const pairscreen()),
          );
        },
      ),
    );
  }
}
