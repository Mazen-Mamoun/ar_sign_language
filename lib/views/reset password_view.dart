import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/password/reset%20password.dart';

class reset_password_view extends StatelessWidget {
  const reset_password_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: reset_password(),
        ),
      

    );
  }
}
