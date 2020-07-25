
import 'package:first_flutter_app/albumView.dart';
import 'package:first_flutter_app/postAlbumView.dart';
import 'package:first_flutter_app/todo.dart';
import 'package:first_flutter_app/todoDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
void main() {
  // debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    initialRoute: '/MyApp',
    routes: {
      '/MyApp': (context) => MyApp(),
      '/TodosScreen' : (context) => TodosScreen(),
      TodoDetail.routName : (context) => TodoDetail(),
      AlbumView.routName : (context) => AlbumView(),
      PostAlbumView.routName : (context) => PostAlbumView()
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color =  Color(0xffb74093);

    Widget topSection = Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 200,
      fit: BoxFit.fill,
    );

    Widget titeSection = Container(
      margin: EdgeInsets.all(32),
      child: Row(
          children: [
            Expanded(
              child :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child : Text(
                      'Oeschinen Lake Campground',
                    ),
                  ),

                  Text(
                      'Kandersteg, Switzerland'
                  )

                ],
              ),
            ),

            FavoriteWidget(),
          ]
      ),
    );



    Widget middlePart = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          _buildButtonColumn('CALL', Icons.call, color, context),
          _buildButtonColumn( 'ROUTE', Icons.near_me, color, context),
          _buildButtonColumn('SHARE', Icons.share, color, context),

        ],
      ),
    );

    Widget textPart = Container(
        padding: EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
              'Alps. Situated 1,578 meters above sea level, it is one of the '
              'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
              'half-hour walk through pastures and pine forest, leads you to the '
              'lake, which warms to 20 degrees Celsius in the summer. Activities '
              'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        )
    );

    return MaterialApp(
      title : "flutter app",
      home : Scaffold(
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: Text("Toolbar"),

          centerTitle: true,
        ),
        body: ListView(
          children: [
            topSection,
            titeSection,
            middlePart,
            textPart

          ],
        ),
      ),
    );
  }//MyApp

  GestureDetector _buildButtonColumn(String title, IconData icon, Color color, BuildContext context){
    return GestureDetector(
      onTap:() {
        Navigator.pushNamed(
            context,
            '/TodosScreen',
            arguments: TodoArguments('Todos')); // navigate with argument
      },
      child : Column(
        children: <Widget>[
          Icon(
            icon, color: color,
          ),
          Text(
            title,
            style: TextStyle(
                color: color,
                fontSize: 12
            ),
          )
        ],
      )
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteState createState() => _FavoriteState();

}
class _FavoriteState extends State<FavoriteWidget>{
  bool _isFavorite = false;
  int _favoriteCount = 0;
  void toggleFavorite(){
    setState(() {
      if(!_isFavorite ){
        _favoriteCount +=1;
        _isFavorite = true;
      }
      else{
        _favoriteCount -=1;
        _isFavorite = false;
      };
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        child: GestureDetector(
          onTap: toggleFavorite,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: (_isFavorite ?  Icon(Icons.star): Icon(Icons.star_border)),
              ),
              Text(
                  '$_favoriteCount'
              )
            ],
          ),

        )
    );
  }

}