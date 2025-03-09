import 'package:flutter/material.dart';
import 'package:tawasel/widgets/sign_in_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: LogInBody(),
        ),
      ),
    );
  }
}
