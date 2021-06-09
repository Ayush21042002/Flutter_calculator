import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final int color;
  final String text;
  final Function callback;
  const CalcButton({
    Key? key,
    this.color = 0,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color == 1
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
