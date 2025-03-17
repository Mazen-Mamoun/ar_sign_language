import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/password/Password%20recovery.dart';

class password_recovery_view extends StatelessWidget {
  const password_recovery_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return
     Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child:
          Password_recovery(),
        ),

    );
  }
}
