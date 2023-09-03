import 'package:coffee/screens/authentication/Register.dart';
import 'package:coffee/screens/authentication/signIn.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn= true ;
  toggleView() {    setState(() => showSignIn = !showSignIn);   }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
    return  SignIn(toggleView: toggleView,);
  }else {
      return Register(toggleView: toggleView,);
    }}
}
