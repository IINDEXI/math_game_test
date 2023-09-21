import 'package:flutter/material.dart';
import '../default/default.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: fontcolor, fontSize: 22.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(fontSize: 30.0),
              ),
              radius: 60.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow //when the result is half of the question.
                  : result < questionLength / 2
                      ? incorrect //when the result is less then half
                      : correct, ////when the result is more then half
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              result == questionLength / 2
                  ? 'ใกล้แล้วอีกนิดเดียว' //when the result is half of the question.
                  : result < questionLength / 2
                      ? 'พยายามอีกนิด' //when the result is less then half
                      : 'เก่งมาก', //when the result is more then half)
              style: const TextStyle(color: fontcolor),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text('เริ่มใหม่',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20.0, letterSpacing: 1.0)),
            ),
          ],
        ),
      ),
    );
  }
}
