import 'package:coffee/models/userModel.dart';
import 'package:coffee/models/user_data_model.dart';
import 'package:coffee/services/databases/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final user = Provider.of<userModel?>(context);

    return StreamBuilder<userDataModel>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          userDataModel? userData = snapshot.data ;
          return Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text("Update your brew settings ",style: TextStyle(fontSize: 18),),
                const SizedBox(height: 20,),
                TextFormField(
                  initialValue: userData?.name,
                  decoration: InputDecoration(
                    label: const Text(""),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                const SizedBox(height: 20,),
                DropdownButtonFormField(
                  value: _currentSugars ?? userData?.sugars,
                  items:
                  Sugars.map(
                          (sugar) {
                    return DropdownMenuItem(child: Text("$sugar sugars"),
                      value: sugar,

                    );
                  }).toList()
                  , onChanged: (value) {
                    return setState(() => _currentSugars = value as String?);
                },),
                const SizedBox(height: 20,),
                Slider(
                  activeColor: Colors.brown[_currentStrength?? userData!.strength!],
                  inactiveColor: Colors.brown[_currentStrength??userData!.strength!],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  value: (_currentStrength??userData?.strength)!.toDouble(), onChanged: (value) {
                    setState(() {
                      _currentStrength = value.round() ;
                    });
                },),
                ElevatedButton(
                    style:ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink[400])) ,
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await DatabaseService(uid: user!.uid ).updateUserData(
                        _currentSugars!,
                        _currentStrength!,
                        _currentName!,


                      );
                      Navigator.pop(context);
                    }
                ),

              ],
            ),
          ),
        );
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}
