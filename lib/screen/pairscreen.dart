import 'package:flutter/material.dart';
import 'package:flutter_application_1/componant/question_image.dart';
import '../default/default.dart';
import '../componant/question_widget_image.dart';
import '../componant/next_button.dart';
import '../componant/option_card.dart';
import '../componant/result_box.dart';

class pairscreen extends StatefulWidget {
  const pairscreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _pairscreenState createState() => _pairscreenState();
}

class _pairscreenState extends State<pairscreen> {
  final List<Question_image> _questions = [
    Question_image(
      id: '1',
      image: '../assets/image/1.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'4': false, '2': false, '1': true, '8': false},
    ),
    Question_image(
      id: '2',
      image: '../assets/image/4.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'4': true, '2': false, '8': false, '6': false},
    ),
    Question_image(
      id: '3',
      image: '../assets/image/7.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'1': false, '3': false, '5': false, '7': true},
    ),
    Question_image(
      id: '4',
      image: '../assets/image/3.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'1': false, '3': true, '5': false, '7': false},
    ),
    Question_image(
      id: '5',
      image: '../assets/image/5.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'7': false, '5': true, '3': false, '1': false},
    ),
    Question_image(
      id: '6',
      image: '../assets/image/10.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'4': false, '6': false, '8': false, '10': true},
    ),
    Question_image(
      id: '7',
      image: '../assets/image/8.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'4': false, '6': false, '8': true, '10': false},
    ),
    Question_image(
      id: '8',
      image: '../assets/image/6.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'4': false, '6': true, '8': false, '10': false},
    ),
    Question_image(
      id: '9',
      image: '../assets/image/2.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'1': false, '2': true, '3': false, '4': false},
    ),
    Question_image(
      id: '10',
      image: '../assets/image/9.jpg',
      title: 'จงเลือกเลขตามจำนวนในรูปภาพ',
      options: {'7': false, '8': false, '9': true, '10': false},
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelect = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; //when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelect = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('กรุณาเลือกคำตอบก่อนกดต่อไป'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelect) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelect = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelect = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('เกมทดสอบคณิตศาสตร์'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Text('Score: $score', style: const TextStyle(fontSize: 18.0)),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              img: _questions[index].image,
              question: _questions[index].title,
              totalQuestion: _questions.length,
            ),
            const Divider(
              color: fontcolor,
            ),
            //add space
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : fontcolor,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
