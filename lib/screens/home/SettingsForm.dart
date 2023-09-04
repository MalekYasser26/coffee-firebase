import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  List Sugars = ['0','1','2','3','4','5'];
  String? _currentName ;
  String? _currentSugars ;
  int? _currentStrength ;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           Text("Update your brew settings ",style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
