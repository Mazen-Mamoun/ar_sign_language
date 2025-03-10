import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/signUp.dart';

class sign_up_view extends StatelessWidget {
  const sign_up_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: signUp(),
        ),
      ),
    );
  }
}
