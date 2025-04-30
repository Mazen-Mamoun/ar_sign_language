import 'package:flutter/material.dart';
import 'package:tawasel/widgets/auth_widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
