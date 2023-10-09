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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เกมทดสอบคณิตศาสตร์',
                style: TextStyle(
                  fontSize: 35,
                ))
          ],
        ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddandSubtractbutton(),
                SizedBox(
                  height: 25.0,
                ),
                multiplyscreenbutton(),
                SizedBox(
                  height: 25.0,
                ),
                dividescreenbutton(),
                SizedBox(
                  height: 25.0,
                ),
                pairscreenbutton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
