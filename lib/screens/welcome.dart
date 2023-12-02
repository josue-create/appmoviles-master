import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:act3_7/widgets/app_button.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});
  static const String routeName = '/Welcome';
  
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppLogo(),
          const SizedBox(height: 48.0,),
          AppButton(color: Colors.lightBlueAccent, nombre: "Login", onPressed: (){Navigator.pushNamed(context, '/Login');}),
          AppButton(color: Colors.blueAccent, nombre: "Registrarse", onPressed: (){Navigator.pushNamed(context, '/Register');})
        ],
        )
      )
    );
  }
}