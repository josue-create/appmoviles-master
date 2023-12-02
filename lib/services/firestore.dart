import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:act3_7/model/media.dart';
// tomado de https://www.youtube.com/watch?v=iQOvD0y-xnw

class FirestoreService {
  final CollectionReference pelis =  FirebaseFirestore.instance.collection('pelis');

  // agregar
  Future<void> addMovie (Media  media) {
    return pelis.add ({
        "idThemoviedb" :  media.id,
        "voteAverage" :  media.voteAverage,
        "title" : media.title, 
        "posterPath" : media.posterPath,
        "backdropPath" : media.backdropPath,
        "overview" : media.overview,
        "releaseDate" : media.releaseDate,
        "releaseYear" : media.releaseYear,
        "genres" : media.genres, 
        "director" : "",
        "timestamp" : Timestamp.now()
      });
  }

  //leer
  Stream<QuerySnapshot> getpelisStream(){
    final pelisStream = pelis.orderBy ('timestamp', descending: true).snapshots();
    return pelisStream;
  }

  //actualizar
  Future<void> updateMovie(String docId, final  Map<String, dynamic> movie) {
    return pelis.doc(docId).update(
      {
        "idThemoviedb" :  movie["id"],
        "voteAverage" :  movie["voteAverage"],
        "title" : movie["title"], 
        "posterPath" : movie["posterPath"],
        "backdropPath" : movie["backdropPath"],
        "overview" : movie["overview"],
        "releaseDate" : movie["releaseDate"],
        "releaseYear" : movie["releaseYear"],
        "genres" : movie["genres"], 
        "director" : movie["director"], 
        "timestamp" : Timestamp.now()
      }
    );
  }


  //borrar
  Future<void> deleteMovie(String docId) {
    return pelis.doc(docId).delete();
  }

}