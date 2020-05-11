import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('DashBoard'),),
      body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(children: <Widget>[
                  
                ],),
              )
              
            ],
          ),
      backgroundColor: Colors.blueAccent[100],
    );
  }
}