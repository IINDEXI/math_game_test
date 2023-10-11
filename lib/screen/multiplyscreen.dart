import 'package:flutter/material.dart';
import '../componant/question.dart';
import '../default/default.dart';
import '../componant/question_widget.dart';
import '../componant/next_button.dart';
import '../componant/option_card.dart';
import '../componant/result_box.dart';


class multiplyscreen extends StatefulWidget {
  const multiplyscreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _multiplyscreenState createState() => _multiplyscreenState();
}

class _multiplyscreenState extends State<multiplyscreen> {
  final List<Question> _questions = [
    Question(
      id: '1',
      title: '2 * 2 เท่ากับเท่าไร?',
      options: {'15': false, '12': false, '4': true, '8': false},
    ),
    Question(
      id: '2',
      title: '10 * 5 เท่ากับเท่าไร?',
      options: {'50': true, '30': false, '40': false, '10': false},
    ),
    Question(
      id: '3',
      title: '22 * 22 เท่ากับเท่าไร?',
      options: {'484': true, '300': false, '450': false, '500': false},
    ),
    Question(
      id: '4',
      title: '50 * 20 เท่ากับเท่าไร?',
      options: {'1500': false, '400': false, '800': false, '1000': true},
    ),
    Question(
      id: '5',
      title: '25 * 2 เท่ากับเท่าไร?',
      options: {'55': false, '50': true, '25': false, '70': false},
    ),
    Question(
      id: '6',
      title: '100 * 20 เท่ากับเท่าไร?',
      options: {'1000': false, '2000': true, '4000': false, '1200': false},
    ),
    Question(
      id: '7',
      title: '225 * 20 เท่ากับเท่าไร?',
      options: {'4500': true, '3000': false, '3250': false, '2750': false},
    ),
    Question(
      id: '8',
      title: '12 * 9 เท่ากับเท่าไร?',
      options: {'106': false, '108': true, '116': false, '104': false},
    ),Question(
      id: '9',
      title: '121 * 5 เท่ากับเท่าไร?',
      options: {'605': true, '505': false, '450': false, '550': false},
    ),
    Question(
      id: '10',
      title: '12 * 12 เท่ากับเท่าไร?',
      options: {'144': true, '122': false, '111': false, '155': false},
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
