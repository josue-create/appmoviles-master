import 'package:flutter/material.dart';
import 'package:act3_7/services/firestore.dart';
import 'package:act3_7/common/util.dart';
import 'dart:ui' as ui;


class MovieDetail extends StatelessWidget {
  final Map<String, dynamic>  movie;
  
  MovieDetail({required this.movie});
  
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack (
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            getLargePictureUrl(movie["posterPath"]),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget> [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(image: NetworkImage(getMediumPictureUrl(movie["posterPath"]))),
                    ),
                    child: const SizedBox(
                      width: 390.0, 
                      height: 390.0
                     ),
                  ),
                  const SizedBox(
                      height: 20.0
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0
                    ),
                    child: Expanded(
                      child: Text( 
                          movie["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                    )
                  ),
                  Column(
                    children: <Widget> [
                      Text( 
                        movie['releaseYear'].toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      Text( 
                        movie["genres"],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                          height: 40.0
                      ),

                      Row(
                        children: <Widget> [
                          const Text( 
                            "Director: " ,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),
                          Text( 
                            movie['director']??"Desconocido",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                          height: 20.0
                      ),
                      const Row(
                        children: <Widget> [
                          Text( 
                          "Reseña: " ,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        ),
                        ],
                      ),
                      
                      Text( 
                        movie['overview'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
                ]
              ),
            ),  
          )
        ],
      ),

    );
  
  }
}