import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/formProviders.dart';

class EmailReg extends StatefulWidget {
  const EmailReg({Key? key}) : super(key: key);

  @override
  State<EmailReg> createState() => _EmailRegState();
}

class _EmailRegState extends State<EmailReg> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: Provider.of<FormProviders>(context,listen : false).emailRegController,
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          hintText: "Please Enter Your Email",
          prefixIconColor: Colors.black,
          prefixIcon: Icon(Icons.email_outlined),),
        keyboardType: TextInputType.emailAddress,


        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Email";
          } else if (
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(Provider.of<FormProviders>(context,listen: false).emailController.text!)==true)
          {
            return "Enter a correct email form";
          }
          return null;
        },

      ),
    );;
  }
}
