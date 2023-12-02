// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:act3_7/services/firestore.dart';
import 'package:act3_7/common/util.dart';



class MovieListItem extends StatelessWidget {
    final Map<String, dynamic> media;
  
  MovieListItem(this.media);
  final FirestoreService firestoreService = FirestoreService();



  @override 
  Widget build(BuildContext context) {


    return Card(
        child: Column(
          children: <Widget> [
            
              Stack (
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: "placeholder.png", 
                    image: getMediumPictureUrl(media["posterPath"]),
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                    fadeInDuration: const Duration(milliseconds: 40),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900]?.withOpacity(0.5),
                      ),
                      constraints: const BoxConstraints.expand(
                        height: 65
                      ),
                    )
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 12.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text( 
                          media["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text( 
                          media["genres"],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                    ],)
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 10.0,
                    child: Column(
                      children: <Widget> [
                        Row(
                          children: <Widget> [
                           Text( 
                            media['releaseYear'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),

                          ],
                        )
                      ],
                    )
                  )
                ],
              )
          ],
        ),
    );
  }
}