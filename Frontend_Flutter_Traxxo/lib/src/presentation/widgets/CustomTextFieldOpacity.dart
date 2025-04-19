import 'package:flutter/material.dart';

class CustomTextFieldOpacity extends StatelessWidget {

  String text;
  Function(String text) onChanged;
  IconData icon;
  EdgeInsetsGeometry margin;
  String? Function(String?)? validator;

  CustomTextFieldOpacity({super.key, 
    required this.text,
    required this.icon,
    required this.onChanged,
    this.margin = const EdgeInsets.only(top: 15, left: 5, right: 5),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.2),
      ),
      child: TextFormField(
        onChanged: (text){
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(height: 20, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
