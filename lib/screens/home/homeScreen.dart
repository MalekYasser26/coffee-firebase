import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/screens/home/BrewList.dart';
import 'package:coffee/screens/home/SettingsForm.dart';
import 'package:coffee/services/auth/auth.dart';
import 'package:coffee/services/databases/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brewModel.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return SettingsForm();
      },);
    }
    return StreamProvider< List <brewModel>?>.value(
      value: DatabaseService().BrewData,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title : Text("coffee"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            TextButton.icon(
                label: Text("Logout",style: TextStyle(color: Colors.black)),
                onPressed: ()async {
                  await _auth.signOut() ;
                }, icon: Icon(Icons.person_outline,color: Colors.black),
                ),
            TextButton.icon(
                label: Text("Settings",style: TextStyle(color: Colors.black)),
                onPressed: ()async {
                   _showSettingsPanel();
                }, icon: Icon(Icons.settings,color: Colors.black),
                )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BrewList(),
            ],
          ),
        ),
      ),
    );
  }
}
