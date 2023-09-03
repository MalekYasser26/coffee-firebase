import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/formProviders.dart';


class PassWidgetReg extends StatefulWidget {
  const PassWidgetReg({Key? key}) : super(key: key);

  @override
  State<PassWidgetReg> createState() => _PassWidgetRegState();
}
bool eyePass = true;

class _PassWidgetRegState extends State<PassWidgetReg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: Provider.of<FormProviders>(context,listen : false).passwordRegController,
        obscureText: eyePass,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          hintText: "Please Enter Your Password",
          prefixIcon: Icon(Icons.lock_outline_rounded),
          focusedBorder: OutlineInputBorder(
          ),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              eyePass ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                eyePass = !eyePass;
              });
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 8) {
            return "Password must be 8 or more";
          }
          return null;
        },

      ),
    );
  }
}
