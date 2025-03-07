import 'package:go_router/go_router.dart';
import 'package:tawasel/views/learning_content_screen.dart';
import 'package:tawasel/views/letters_content_screen.dart';
import 'package:tawasel/views/numbers_content_screen.dart';
import 'package:tawasel/views/splash_view.dart';
import 'package:tawasel/views/test_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSplashView = '/splashView';
  static const kLearningContentScreen = '/learningContentScreen';
  static const kLettersScreen = '/lettersScreen';
  static const kNumberScreen = '/numbersScreen';
  static const kTestScreen = '/testScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLearningContentScreen,
        builder: (context, state) => const LearningContentScreen(),
      ),
      GoRoute(
        path: kTestScreen,
        builder: (context, state) => const TestScreen(),
      ),
      GoRoute(
        path: kLettersScreen,
        builder: (context, state) => LettersScreen(),
      ),
      GoRoute(
        path: kNumberScreen,
        builder: (context, state) => NumbersScreen(),
      ),
    ],
  );
}
