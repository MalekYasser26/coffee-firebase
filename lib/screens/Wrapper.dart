import 'package:coffee/models/userModel.dart';
import 'package:coffee/screens/authentication/authentication.dart';
import 'package:coffee/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userModel?>(context);
    print(user);

    // choose which screen to return
    if (user==null){
      return Authenticate();
    }else{
      return HomeScreen();
    }
  }
}
