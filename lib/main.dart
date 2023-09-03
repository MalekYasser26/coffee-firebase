import 'package:coffee/models/userModel.dart';
import 'package:coffee/providers/formProviders.dart';
import 'package:coffee/screens/Wrapper.dart';
import 'package:coffee/services/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => FormProviders(),)
        ])
      ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<userModel?>.value(
      value:AuthService().user ,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
