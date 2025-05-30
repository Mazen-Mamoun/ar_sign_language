import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/Cubits/exam_cubit/exam_cubit.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';
import 'package:tawasel/Models/content_models/item_model.dart';
import 'package:tawasel/bloc_observer.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_theme_data.dart';
import 'package:tawasel/helper/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ItemModelAdapter());

  await Hive.openBox(kItemBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ExamCubit(),
        ),
        BlocProvider(
          create: (context) => SubmitCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
