import 'package:coffee/models/brewModel.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({Key? key,required this.brews}) : super(key: key);
  final brewModel brews ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Colors.brown[brews.strength],radius: 25),
          title: Text(brews.name),
          subtitle:Text("Takes ${brews.sugars} sugar(s)") ,
        ),
      ),
    );
  }
}
