import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AuthCubit(),
          child: const LogInBody(),
        ),
      ),
    );
  }
}
