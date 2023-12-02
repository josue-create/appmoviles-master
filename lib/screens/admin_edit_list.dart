import 'package:act3_7/screens/movie_edit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:act3_7/model/media.dart';
import 'package:act3_7/screens/movie_list_item.dart';
import 'package:act3_7/services/firestore.dart';



class AdminEditList extends StatefulWidget {
  final String  queryString;
  
  const AdminEditList({
    required this.queryString
  });
  
  @override
  State<AdminEditList> createState() => _AdminEditListState();
}

class _AdminEditListState extends State<AdminEditList> {
  // final List<Media> _media = <Media>[];
  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return 
      StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getpelisStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List movieList = snapshot.data!.docs;

            //mostrar
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                  DocumentSnapshot document = movieList[index];
                  String docId = document.id;
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (context){
                        return MovieEdit(id: docId.toString(), movie: data);
                      }));  
                    },
                    child: MovieListItem(data),
                  );
              });
          } else {
            return const Text("Aún no hay películas en el catálogo!");
          }
        },
      );
  }
}