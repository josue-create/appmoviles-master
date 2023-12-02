// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String intputText;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const AppTextField({
    required this.intputText,
    required this.onChanged,
    required this.obscureText 
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hintText: intputText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)
          )
        ),
        onChanged: onChanged,
        obscureText: obscureText,
      );
      
  }
}

