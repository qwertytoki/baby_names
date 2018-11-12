import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final dummySnapshot = [
  {"name":"Filip","votes":15},
  {"name":"Filip","votes":15},
  {"name":"Filip","votes":15},
  {"name":"Filip","votes":15},
  {"name":"Filip","votes":15}
]

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState(){
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text('Baby Name Votes')),
      body: _buildBody(context),
      );
  }
}

Widget _buildBody(BuildContext context){
  //FIXME this is demo code
  return _buildList(context,dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot){
  padding: const EdgeInsets.only(top:20.0),
  children: snapshot.map((data)=> _buildListItem(context,data)).toList()
}

Widget _buildListItem(BuildContext context, Map data){
  final record = Record.fromMap(data);
  return Padding(
    key: ValueKey(record.name),
    padding: const EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.9)
      ),
      child:ListTile(
        title:Text(record.name),
        trailing: Text(record.votes.toString()),
        onTap:() => print(record),
      )
    )
  );
}

class Record{

}
