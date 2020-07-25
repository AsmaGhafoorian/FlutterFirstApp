
import 'package:first_flutter_app/postAlbumModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'network.dart';

class PostAlbumView extends StatefulWidget {
  PostAlbumView({Key key}) : super(key: key);
  static const routName = '/PostAlbumView';

  @override
  _PostAlbumState createState() {
    return _PostAlbumState();
  }
}

class _PostAlbumState extends State<PostAlbumView> {
  final TextEditingController _controller = TextEditingController();
  Future<postAlbum> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              RaisedButton(
                child: Text('Create Data'),
                onPressed: () {
                  setState(() {
                    _futureAlbum = createAlbum(_controller.text);
                  });
                },
              ),
            ],
          )
              : FutureBuilder<postAlbum>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}