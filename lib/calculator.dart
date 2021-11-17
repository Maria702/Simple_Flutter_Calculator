import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: Color.fromARGB(230, 460, 20, 1),
          shape: CircleBorder(),
          primary: Color.fromRGBO(120, 100, 560, 100)),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          result = result + text;
        });
      },
    );
  }

  clearAll() {
    setState(() {
      result = "";
    });
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Simple Calculator',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                right: 14,
                top: 5,
                left: 14,
              ),
              child: Column(
                children: [
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: result,
                      hintStyle: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.pink, width: 4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: clearAll,
                        child: Icon(Icons.cancel_outlined),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.red.shade100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      ElevatedButton(
                        child: Text('AC'),
                        onPressed: clear,
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.purple.shade200,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      btn(
                        "%",
                      ),
                      btn("/"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        btn("7"),
                        btn("8"),
                        btn("9"),
                        btn("*"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        btn("4"),
                        btn("5"),
                        btn("6"),
                        btn("-"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        btn("1"),
                        btn("2"),
                        btn("3"),
                        btn("+"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 1),
                          child: btn("0"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: btn(
                            ".",
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text('='),
                            onPressed: output,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: Colors.orange.shade100,
                                padding: EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 0),
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
