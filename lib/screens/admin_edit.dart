import 'package:act3_7/screens/admin_edit_list.dart';
import 'package:act3_7/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AdminEdit extends StatefulWidget {
  const AdminEdit({super.key});
  static const String routeName = '/AdminEdit';
  
  @override
  State<AdminEdit> createState() => _AdminEditState();

}

class _AdminEditState extends State<AdminEdit> {
final FirestoreService firestoreService = FirestoreService();
final TextEditingController textController = TextEditingController();
final auth = FirebaseAuth.instance;

  Future _signOut()  async{
    await FirebaseAuth.instance.signOut();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar películas"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            DrawerHeader(
              child: AppLogo()
            ),
            ListTile ( 
                title: const Text("Catálogo de películas"),
                onTap: () {Navigator.pushNamed(context, '/Home');},
                // trailing: Icon(Icons.access_alarm_outlined),
            ),
            ListTile ( 
                title: const Text("Agregar películas"),
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.pushNamed(context, '/AdminAdd');},
            ),
            ListTile ( 
                title: const Text("Editar películas"),
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.of(context).pop();},
            ),
            const Divider(
              height: 5.0,
            ),
            ListTile ( 
                title: const Text("Log out"),
                trailing: const Icon(Icons.close),
                onTap: () => {
                  _signOut().then((value) => Navigator.pushNamed(context, '/Login'))
                }
            ),
          ]
        )
      ),
      body: PageView(
        children: const [
          AdminEditList(queryString: "")
        ],
      ),
    );
  }
}

