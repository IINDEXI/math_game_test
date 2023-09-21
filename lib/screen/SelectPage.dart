import 'package:flutter/material.dart';
import '../default/default.dart';
import '../componant/header.dart';
import '../componant/button.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: const Column(
          children: [
            Header(),
            Divider(
              color: fontcolor,
            ),
            SizedBox(
              height: 25.0,
            ),
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                button1(),
                SizedBox(
                  height: 25.0,
                ),
                button2(),
                SizedBox(
                  height: 25.0,
                ),
                button3(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
