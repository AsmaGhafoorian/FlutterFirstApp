

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:first_flutter_app/albumModel.dart';
import 'package:first_flutter_app/photoModel.dart';
import 'package:first_flutter_app/postAlbumModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<AlbumModel> fetchAlbum() async {
  final response = await http.get(
                        'https://jsonplaceholder.typicode.com/albums/1',
                        headers: {HttpHeaders.authorizationHeader: "token"},);

  if(response.statusCode == 200){
    return AlbumModel.fromJson(json.decode(response.body));

  }else{
    throw Exception('Failed to load');
  }

}

  Future<postAlbum> createAlbum(String title) async {
    final http.Response response = await http.post('https://jsonplaceholder.typicode.com/albums',
            headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
            body: jsonEncode(<String, String>{
              'title': title,
            }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return postAlbum.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  List<PhotoModel> parsPhotos(String response){
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
  }
  Future<List<PhotoModel>> fetchPhotos(http.Client client) async{   // http.Client :  This makes the function easier to test and use in different environments.
  
    final response = await client.get('https://jsonplaceholder.typicode.com/photos');
    return compute(parsPhotos, response.body);

  }