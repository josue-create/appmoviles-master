import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:act3_7/widgets/app_button.dart';
import 'package:act3_7/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = '/Register';
  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final auth = FirebaseAuth.instance;
String _email = '';
String _password = '';


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
           AppTextField(intputText: "Ingresar email", onChanged: (value){_email = value;}, obscureText: false),
          const SizedBox(height: 8.0,),
           AppTextField(intputText: "Ingresar contraseña", onChanged: (value){_password = value;}, obscureText: true),
          const SizedBox(height: 23.0,),
          AppButton(color: Colors.lightGreenAccent, 
            nombre: "Registrar", 
            onPressed: ( ) {signIn(context);},
          )
        ])
      )
    );
  }

  Future signIn(context) async {
    
    try {
      await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      messageBox("Registro exitoso!", true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        messageBox("The password provided is too weak.", false); 
      } else if (e.code == 'email-already-in-use') {
        messageBox("The account already exists for that email.", false); 
      }
    } catch (e) {
      print(e);
    }


  }

}

