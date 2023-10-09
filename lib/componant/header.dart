import 'package:flutter/material.dart';
import '../default/default.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Column(children: [
        SizedBox(height: 10,),
        Text(
        'กรุณาเลือกบททดสอบ',
        style: TextStyle(
          fontSize: 20.0,
          color: fontcolor,
        ),
      ),
      ],)
    );
  }
}
