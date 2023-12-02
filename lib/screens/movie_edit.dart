import 'package:flutter/material.dart';
import 'package:act3_7/services/firestore.dart';
import 'package:act3_7/common/util.dart';
import 'dart:ui' as ui;
import 'package:act3_7/widgets/app_button.dart';



class MovieEdit extends StatefulWidget {
  final String id;
  final Map<String, dynamic>  movie;
  
  const MovieEdit ({ Key? key, required this.id,  required this.movie }): super(key: key);
  
  static const String routeName = '/MovieEdit';
  
  @override
  State<MovieEdit> createState() => _MovieEditState();
}

class _MovieEditState extends State<MovieEdit> {

final FirestoreService firestoreService = FirestoreService();
final _formKey = GlobalKey<FormState>();


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
    return  Scaffold(
      body: Stack (
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            getLargePictureUrl(widget.movie["posterPath"]),
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
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0
                    ),
                    child: const Expanded(
                      child: Text(
                          'Edición de película',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0
                          ),
                        ),
                    )
                  ),
                  Form (
                    key: _formKey ,
                    child: 
              Column(
                      children: <Widget> [
                            const SizedBox(
                          height: 20.0
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'nombre de la pelicula',
                          labelText: 'Titulo:'
                        ),
                        initialValue: widget.movie["title"],
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Debe tener un titulo';
                            }
                          },
                          onSaved: (val) =>
                              setState(() => widget.movie["title"] = val),
                        ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'año en que se estreno',
                          labelText: 'Año:'
                        ),
                        initialValue: widget.movie["releaseYear"].toString(),
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Debe tener un año de estreno';
                            }
                          },
                          onSaved: (val) =>
                              setState(() => widget.movie["releaseYear"] = val),
                        ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'genero o categoria de la pelicula',
                          labelText: 'Genero:'
                        ),
                        initialValue: widget.movie["genres"],
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Debe tener un genero';
                            }
                          },
                          onSaved: (val) =>
                              setState(() => widget.movie["genres"] = val),
                        ),


                      TextFormField(
                        
                        decoration: const InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'nombre del director o directores',
                          labelText: 'Director:'
                        ),
                        initialValue: widget.movie["director"],
                        onSaved: (val) =>
                              setState(() => widget.movie["director"] = val),
                        ),

                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'pequeño resumen describiendo la trama principal.',
                          labelText: 'Reseña:'
                        ),
                        maxLines: 8,
                        initialValue: widget.movie["overview"],
                          onSaved: (val) =>
                              setState(() => widget.movie["overview"] = val),
                        ),
                      const SizedBox(
                          height: 20.0
                      ),
                      Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: Row(
                              children: <Widget>[
                                AppButton(
                                  color: Colors.greenAccent, 
                                  nombre: "  Grabar  ", 
                                  onPressed: (){
                                    final form = _formKey.currentState;
                                    if (form!.validate()) {
                                      /*
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Procesando..."))
                                      );
                                      */
                                      form.save();
                                      firestoreService.updateMovie(widget.id, widget.movie);
                                      Navigator.pop(context);
                                    }
                                }),
                                const SizedBox(
                                    width: 50.0
                                ),
                                AppButton(
                                  color: Colors.yellowAccent,
                                  nombre: " Cancelar ", 
                                  onPressed: (){
                                      Navigator.pop(context);
                                    }
                                )
                              ],
                            )
                      )     
                    ])
                  )
                  ]
                ),
              )
            ),  
        ],
      ),
    );
  }
}