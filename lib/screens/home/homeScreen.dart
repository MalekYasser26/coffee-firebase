import 'package:coffee/services/auth/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )
        ],
      ),
    );
  }
}
