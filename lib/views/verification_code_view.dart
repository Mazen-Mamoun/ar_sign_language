import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/password/verification_code.dart';

class verification_code_view extends StatelessWidget {
  const verification_code_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child:
        verification_code(),
      ),

    );;
  }
}
