import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main()async {
  List data = await getData ();
  String myData = data[0]['title'];
  print (data) ;

  runApp(
    MaterialApp(
  title: 'api ',
  home: Scaffold (
    backgroundColor: Colors.blueGrey,

    body: Center(
      child: ListView.builder(
        itemCount: data.length,
          itemBuilder: (BuildContext context,int position ){
            if(position.isOdd) return new Divider();
            final newPosition = position ~/ 2;

          return ListTile(
          title: Text('${data[newPosition]['title']}',style: TextStyle(
            color: Colors.white,fontSize: 20
          ),),
            subtitle: Text ('${data[newPosition]['body']}',style: TextStyle(color: Colors.pink.shade200),),

            leading: CircleAvatar(
              child: Text('${data[newPosition]['id']}') ,
              backgroundColor: Colors.pink.shade200,
              radius: 30,
            ),


          );
          }),

    ),
  )

));}
Future <List>  getData() async{
  String myUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(myUrl);
  return json.decode(response.body);
}