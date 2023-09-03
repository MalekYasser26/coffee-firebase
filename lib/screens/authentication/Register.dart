import 'package:coffee/screens/widgets/emailReg.dart';
import 'package:coffee/screens/widgets/passReg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/formProviders.dart';
import '../../services/auth/auth.dart';

class Register extends StatefulWidget {

  final toggleView;
  const Register({Key? key, this.toggleView}) : super(key: key);


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign up"),
        actions: [
          TextButton.icon(
              onPressed: () {
                setState(() {
                  widget.toggleView() ;
                });
                print("hereeee");
              }, icon: Icon(Icons.login,color: Colors.white),
            label: Text("login",style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
          child: Form(
              key: _formkey,
              child: Column(
            children: [
              SizedBox(height: 20,),
              EmailReg(),
              SizedBox(height: 20,),
              PassWidgetReg(),
              TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()){
                      setState(() {
                        print("error");
                        loading = true ;
                      });
                      dynamic result = await _auth.RegEmailPass(
                          Provider.of<FormProviders>(context,listen: false).emailRegController.text,
                          Provider.of<FormProviders>(context,listen: false).passwordRegController.text);
                      if(result==null){
                        setState(() {
                          print("error");
                          loading = false ;
                        });

                      }
                    }
                   }, child: Text("Register",style: TextStyle(color: Colors.white),)),
              loading ? CircularProgressIndicator() : Text("") ,

            ],


          ))
      ),
    );
  }
}
