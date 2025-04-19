import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  
  String text;
  Color color;
  Color textColor;
  EdgeInsetsGeometry margin;

  CustomButton({super.key, 
  required this.text,
  this.color = Colors.white,
  this.textColor = Colors.black,
  this.margin = const EdgeInsets.only(bottom: 10, left: 5, right: 5), });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: margin,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.black,
              width: 0.5,
            )
          )
          ),
          
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
