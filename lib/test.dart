import 'package:flutter/material.dart';

class QuestionTextWithImage extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  final String _img;

  QuestionTextWithImage(this._question, this._questionNumber, this._img);
  @override
  _QuestionTextWithImageState createState() => _QuestionTextWithImageState();
}

class _QuestionTextWithImageState extends State<QuestionTextWithImage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Image.asset(widget._img, height: 400.0,width: 400.0,),
            Text(
              "${widget._questionNumber}: ${widget._question}",
            ),
          ],
        )),
      ),
    );
  }
}