import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // any type of value can be stored in it
  var userInput = "";
  var answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.bottomRight,
                        child: Text(userInput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),)),
                    SizedBox(height: 15,),
                    Text(answer.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(title: 'AC', onPress: () {
                        userInput += '';
                        answer = '';
                        setState(() {

                        });
                      },),  // calling MyButton which we created through stateless widget

                      MyButton(title: '+/-', onPress: () {  },),
                      MyButton(title: '%', onPress: () {  },),
                      MyButton(title: '/', color: Colors.orange, onPress: () {
                        userInput += '/';
                        setState(() {

                        });
                      },),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(title: '7', onPress: () {
                        userInput += '7'; // += means userinput + 7 => assume 8 is enter first 8 is stored in user input now it will be 87
                        setState(() {

                        });
                      },),
                      MyButton(title: '8', onPress: () {
                        userInput += '8';
                        setState(() {

                        });
                      },),
                      MyButton(title: '9', onPress: () {
                        userInput = '9';
                        setState(() {

                        });
                      },),

                      MyButton(title: 'x', color: Colors.orange, onPress: () {
                        userInput += 'x';
                        setState(() {

                        });
                      },),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(title: '4', onPress: (){
                        userInput += '4';
                        setState(() {

                        });
                      },),

                      MyButton(title: '5', onPress: (){
                        userInput += '5';
                        setState(() {

                        });
                      },),
                      MyButton(title: '6', onPress: (){
                        userInput += '6';
                        setState(() {

                        });
                      },),
                      MyButton(title: '-', color: Colors.orange, onPress: (){
                        userInput += '-';
                        setState(() {

                        });
                      },),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(title: '1', onPress: (){
                        userInput += '1';
                        setState(() {

                        });
                      },),
                      MyButton(title: '2', onPress: (){
                        userInput += '2';
                        setState(() {

                        });
                      },),
                      MyButton(title: '3', onPress: (){
                        userInput += '3';
                        setState(() {

                        });
                      },),
                      MyButton(title: '+', color: Colors.orange, onPress: (){
                        userInput += '+';
                        setState(() {

                        });
                      },),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(title: '0', onPress: (){
                        userInput += '0';
                        setState(() {

                        });
                      },),
                      MyButton(title: '.', onPress: (){
                        userInput += '.';
                        setState(() {

                        });
                      },),
                      MyButton(title: 'DEL', onPress: (){
                        // for deleting/removing last character
                        userInput = userInput.substring(0, userInput.length - 1); // like length is 5 and sub that 5-1 = 4 will be left
                        setState(() {

                        });
                      },),

                      MyButton(title: '=', color: Colors.orange, onPress: (){
                        equalPress(); // calling equalPress
                        setState(() {

                        });
                      },),
                    ],
                  ),
                  // Text("Is Coding difficult ?", style: headingTextStyle,)  // use headingTextStyle => style is defined there
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method for equal button
  void equalPress(){
    // for multiplication
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser(); // parser is from math expression we are initializing it
    Expression expression = p.parse(finalUserInput);
    // Expression expression = p.parse(userInput); // Initializing expression => expression is our userInput
    ContextModel contextModel = ContextModel();  // now it will check it's context

    // Evaluation type will be real number it will not be a vector and passing contextModel
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);  // evaluate this expression which we initialized above
    answer = eval.toString(); //
  }

}

