import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:act3_7/widgets/app_button.dart';
import 'package:act3_7/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/Login';
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final auth = FirebaseAuth.instance;
String _email = "";
String _password = "";


messageBox(String msg, bool goHome) async {
  showDialog(
    context: context, 
    builder: (context)=> AlertDialog(
      title: const Text("Peliculas"),
      content: Text(msg),
      actions: [
        ElevatedButton(
          onPressed: (){
            if (goHome) {
              Navigator.of(context).pushNamed("/Home");
            } else {
              Navigator.pop(context);
            }
            
          }, 
          child: const Text("Ok"))
      ],
    )
  );
}

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
           AppTextField(intputText: "Ingresar email", onChanged: (value){_email = value;}, obscureText: false ),
          const SizedBox(height: 8.0,),
           AppTextField(intputText: "Ingresar contraseña", onChanged: (value){_password = value;}, obscureText: true),
          const SizedBox(height: 23.0,),
          AppButton(
            color: Colors.lightBlueAccent, 
            nombre: "Log in", 
            onPressed: (){
              logIn(context);
          }),
        ],
        )
      )
      
    );
  }


  Future logIn(context) async {
    
    try {
      await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      messageBox("Bienvenido", true);
    } catch (e) {
      switch (e) {
        case 'wrong-password':
          messageBox("The password provided is incorrect.", false); 
          break;
        case 'user-not-found':
          messageBox("The account do not exists.", false); 
          break;
      }
    }
  }
}

