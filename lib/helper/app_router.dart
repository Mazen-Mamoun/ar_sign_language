import 'package:go_router/go_router.dart';
import 'package:sign_app/Views/home_view.dart';
import 'package:sign_app/Views/learning_content_screen.dart';
import 'package:sign_app/Views/splash_view.dart';
import 'package:sign_app/Views/test_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLearningContentScreen = '/learningContentScreen';
  static const kAlphaScreen = '/alphaScreen';
  static const kNumberScreen = '/alphaScreen';
  static const kTestScreen = '/testScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kLearningContentScreen,
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
