import 'package:flutter/material.dart';

// creating components in flutter
class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;


  // initialize title in constructor or use required keyword there => default value will be shown if no value is passed
  MyButton({Key? key, required this.title, this.color = Colors
      .grey, required this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              // color: Colors.orange,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(title, style: TextStyle(
              fontSize: 20,
              color: Colors.white,),),), // whiteColor is from constant.dart file
          ),
        ),
      ),
    );
  }
}