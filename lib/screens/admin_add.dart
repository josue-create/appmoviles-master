import 'package:act3_7/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:act3_7/screens/media_list.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AdminAdd extends StatefulWidget {
  const AdminAdd({super.key});
  static const String routeName = '/AdminAdd';
  
  @override
  State<AdminAdd> createState() => _AdminAddState();

}

class _AdminAddState extends State<AdminAdd> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  int _selectedIndex = 0;
  final auth = FirebaseAuth.instance;

  Future _signOut()  async{
    await FirebaseAuth.instance.signOut();
  }
    

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar películas"),
        actions: <Widget> [
          IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.search, color: Colors.blueAccent))
        ],
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
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.pushNamed(context, '/Home');},
            ),
            ListTile ( 
                title: const Text("Agregar películas"),
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.of(context).pop();},
            ),
            ListTile ( 
                title: const Text("Administrar películas"),
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.pushNamed(context, '/AdminEdit');},
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
          MediaList(queryString: "")
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Populares"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Proximamente"),
          BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Mejor valoradas"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],  

        onTap: (value) {
          _selectedIndex = value;
        },
      ),
    );

  }
}

