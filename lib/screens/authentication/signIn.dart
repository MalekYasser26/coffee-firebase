import 'package:coffee/screens/widgets/emailSignin.dart';
import 'package:coffee/screens/widgets/passSignin.dart';
import 'package:coffee/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/formProviders.dart';

class SignIn extends StatefulWidget {

  final toggleView;
  const SignIn({Key? key, this.toggleView}) : super(key: key);


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                widget.toggleView() ;
                print("signin");

              });
            }, icon: Icon(Icons.login,color: Colors.white),
            label: Text("Register",style: TextStyle(color: Colors.white)),
          )

        ],
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign in"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
         child: Form(
             key: _formkey,
             child: Column(
           children: [
             SizedBox(height: 20,),
             EmailWidgetLogin(),
             SizedBox(height: 20,),
             PassWidgetLogin(),
             TextButton(
               style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                 onPressed: () async {
                   if (_formkey.currentState!.validate()){
                     setState(() {
                       loading = true ;
                     });
                     dynamic result = await _auth.LoginEmailPass(
                         Provider.of<FormProviders>(context,listen: false).emailController.text,
                         Provider.of<FormProviders>(context,listen: false).passwordController.text);
                     if(result==null){
                       setState(() {
                         print("error");
                         loading = false ;
                       });

                     }
                   }        }, child: Text("Sign in",style: TextStyle(color: Colors.white),)),
             loading ? CircularProgressIndicator() : Text("") ,
           ],


         ))
      ),
    );
  }
}
