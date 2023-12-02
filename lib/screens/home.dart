import 'package:act3_7/screens/movie_list.dart';
import 'package:act3_7/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';




class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/Home';
  
  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
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
        title: const Text("Catalogo de películas"),
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
                onTap: () {Navigator.of(context).pop();},
                // trailing: Icon(Icons.access_alarm_outlined),
            ),
            ListTile ( 
                title: const Text("Agregar películas"),
                // trailing: Icon(Icons.access_alarm_outlined),
                onTap: () {Navigator.pushNamed(context, '/AdminAdd');},
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
          MovieList(queryString: "")
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

