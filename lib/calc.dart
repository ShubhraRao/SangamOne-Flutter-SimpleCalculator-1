import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int firstNumber;
  int secondNumber;
  String operators;
  int result;

  operatorFunction(String oper) {

  }

  numberFunction(int number) {
    print(number);
    print(result);
    print(firstNumber);
    print(secondNumber);
    print(operators);
    setState(() {
      if (result != null) {
        result = null;
        firstNumber = number;
        return;
      }
      if (firstNumber == null) {
        firstNumber = number;
        return;
      }
      if(operators==null){
        firstNumber = int.parse(firstNumber.toString() + number.toString());
        return;
      }
      if (secondNumber == null) {
        secondNumber = number;
        return;
      }
      secondNumber = int.parse(secondNumber.toString() + number.toString());
    });
  }

  String displayResult() {
    print(result);
    print(firstNumber);
    print(secondNumber);
    print(operators);
    // setState(() {
      if (result != null) {
        return result.toString();
      }  if (secondNumber != null) {
        var a = firstNumber.toString() + operators + secondNumber.toString();
        return a;
      }  if (operators != null) {
        var a = firstNumber.toString() + operators;
        return a;
      }  if (firstNumber != null) {
        print("firstnumber not null");
        return firstNumber.toString();
      } 
      else {
        return "0";
      }
    // });
    return "0";
  }

  Widget button(String text) {
    return FlatButton(
      color: Colors.black,
      height: 100.0,
      onPressed: () {
        numberFunction(int.parse(text));
      },
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("Calculator")),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Display result

              Container(
                  height: 200.0,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(displayResult(),
                            style:
                                TextStyle(fontSize: 60, color: Colors.white)),
                      ))),

              Divider(
                color: Colors.grey,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button("7"),
                    button("8"),
                    button("9"),
                    button("/"),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button("4"),
                    button("5"),
                    button("6"),
                    button("*"),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button("1"),
                    button("2"),
                    button("3"),
                    button("-"),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button("C"),
                    button("0"),
                    button("="),
                    button("+"),
                  ]),
            ]));
  }
}
