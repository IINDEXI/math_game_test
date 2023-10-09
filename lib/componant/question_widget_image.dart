import 'package:flutter/material.dart';
import '../default/default.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestion,
    required this.img,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestion;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Image.asset(
              img,
              height: 200.0,
              width: 200.0,
            ),
            Text(
              'ข้อที่ ${indexAction + 1}/$totalQuestion: $question',
              style: const TextStyle(
                fontSize: 24.0,
                color: fontcolor,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
