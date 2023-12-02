// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final MaterialAccentColor color;
  final String nombre;
  final VoidCallback onPressed;

  const AppButton({
    required this.color, 
    required this.nombre, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material (
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          child: SizedBox(
            height: 43.0,
            child: 
              TextButton(
                onPressed: onPressed,
                child: Text(nombre),
              ),
          )
        ),
      );

  }
}