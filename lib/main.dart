import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff161616),
        accentColor: Color(0xfff9b208),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline6: GoogleFonts.rubik(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
      ),
      home: MyCalculator(title: 'Calculator Demo'),
    );
  }
}

class MyCalculator extends StatefulWidget {
  final String title;

  MyCalculator({required this.title});

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _expression = "";
  String _history = "";

  void _buttonPress(String text) {
    setState(() {
      _expression += text;
    });
  }

  void _allClear(String text) {
    setState(() {
      _expression = "";
      _history = "";
    });
  }

  void _clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void _evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Color(0xfff98404),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              alignment: Alignment.bottomRight,
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 14),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "AC",
                  color: 1,
                  callback: _allClear,
                ),
                CalcButton(
                  text: "C",
                  color: 1,
                  callback: _clear,
                ),
                CalcButton(
                  text: "%",
                  color: 1,
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "/",
                  color: 1,
                  callback: _buttonPress,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "7",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "8",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "9",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "x",
                  color: 1,
                  callback: _buttonPress,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "4",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "5",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "6",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "-",
                  color: 1,
                  callback: _buttonPress,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "1",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "2",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "3",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "+",
                  callback: _buttonPress,
                  color: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "CD",
                  callback: (_) {},
                ),
                CalcButton(
                  text: "0",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: ".",
                  callback: _buttonPress,
                ),
                CalcButton(
                  text: "=",
                  color: 1,
                  callback: _evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
