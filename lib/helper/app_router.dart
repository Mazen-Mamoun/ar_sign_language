import 'package:go_router/go_router.dart';
import 'package:tawasel/views/learning_content_screen.dart';
import 'package:tawasel/views/test_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLearningContentScreen = '/learningContentScreen';
  static const kAlphaScreen = '/alphaScreen';
  static const kNumberScreen = '/alphaScreen';
  static const kTestScreen = '/testScreen';
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: '/',
        builder: (context, state) => const LearningContentScreen(),
      ),
      GoRoute(
        path: kTestScreen,
        builder: (context, state) => const TestScreen(),
      ),
      // GoRoute(
      //   path: kAlphaScreen,
      //   builder: (context, state) => const NumberView(),
      // ),
    ],
  );
}
