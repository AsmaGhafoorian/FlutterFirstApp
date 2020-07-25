

import 'package:first_flutter_app/postAlbumModel.dart';
import 'package:first_flutter_app/postAlbumView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'albumModel.dart';
import 'network.dart';

  class AlbumView extends StatefulWidget {
    static const routName = '/AlbumView';
    AlbumView({Key key}) : super(key: key);

    @override
    _AlbumState createState() => _AlbumState();
  }


  class _AlbumState extends State<AlbumView>{

    Future<AlbumModel> futureAlbum;

    @override
    void initState() {
      super.initState();
      futureAlbum = fetchAlbum();
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
          home: Scaffold(
            appBar: AppBar(
            title: Text('Fetch Data Example'),
            ),
            body: Center(
                child: Column(
                    children: <Widget>[
                     FutureBuilder<AlbumModel>(
                      future: futureAlbum ,
                      builder: (context, snapshot){
                        if (snapshot.hasData) {
                          return Text(
                              snapshot.data.title,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      }
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PostAlbumView.routName);
                      },
                      child: Text('Search Album'),
                    )
                ]
                )
            )
          ),
      );
    }

  }
