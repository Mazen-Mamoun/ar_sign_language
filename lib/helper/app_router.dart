import 'package:go_router/go_router.dart';
import 'package:tawasel/views/home_view.dart';
import 'package:tawasel/views/learning_content_screen.dart';
import 'package:tawasel/views/letters_content_screen.dart';
import 'package:tawasel/views/login_view.dart';
import 'package:tawasel/views/numbers_content_screen.dart';
import 'package:tawasel/views/splash_view.dart';
import 'package:tawasel/views/test_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSplashView = '/splashView';
  static const kloginView = '/loginView';
  static const kLearningContentScreen = '/learningContentScreen';
  static const kLettersScreen = '/lettersScreen';
  static const kNumberScreen = '/numbersScreen';
  static const kWordsScreen = '/wordsScreen';
  static const kTestScreen = '/testScreen';
  static const kExamScreen = '/examScreen';
  static const kLettersExamScreen = '/lettersExamScreen';
  static const kNumbersExamScreen = '/numbersExamScreen';
  static const kWordsExamScreen = '/wordsExamScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kExamScreen,
        builder: (context, state) => const ExamScreen(),
      ),
      GoRoute(
        path: kLettersExamScreen,
        builder: (context, state) => LettersExamScreen(),
      ),
      GoRoute(
        path: kWordsExamScreen,
        builder: (context, state) => WordsExamScreen(),
      ),
      GoRoute(
        path: kNumbersExamScreen,
        builder: (context, state) => NumbersExamScreen(),
      ),
      GoRoute(
        path: kLearningContentScreen,
        builder: (context, state) => const LearningContentScreen(),
      ),
      GoRoute(
        path: kloginView,
        builder: (context, state) => const LogInView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kWordsScreen,
        builder: (context, state) => WordsScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
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
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}

