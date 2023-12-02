import 'package:flutter/material.dart';
import 'package:act3_7/common/http_handler.dart';
import 'package:act3_7/model/media.dart';
import 'package:act3_7/screens/media_list_item.dart';


class MediaList extends StatefulWidget {
  final String  queryString;
  
  const MediaList({
    required this.queryString
  });
  
  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final List<Media> _media = <Media>[];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies); 
    });
    print ("total =  ${_media.length}" );
  }

  @override
  Widget build(BuildContext context) {
    return 
      ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
           return MediaListItem(_media[index]);
        },
      );
  }
}