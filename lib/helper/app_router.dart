import 'package:go_router/go_router.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/views/auth_views/verification_code_view.dart';
import 'package:tawasel/views/exam_screen.dart';
import 'package:tawasel/views/home_view.dart';
import 'package:tawasel/views/learning_content_screen.dart';
import 'package:tawasel/views/letters_content_screen.dart';
import 'package:tawasel/views/letters_exam_screen.dart';
import 'package:tawasel/views/auth_views/login_view.dart';
import 'package:tawasel/views/numbers_content_screen.dart';
import 'package:tawasel/views/numbers_exam_screen.dart';
import 'package:tawasel/views/auth_views/password_recovery_view.dart';
import 'package:tawasel/views/profile_view.dart';
import 'package:tawasel/views/auth_views/sign_up_view.dart';
import 'package:tawasel/views/splash_view.dart';
import 'package:tawasel/views/test_screen.dart';
import 'package:tawasel/views/words_content_screen.dart';
import 'package:tawasel/views/words_exam_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSplashView = '/splashView';
  static const kloginView = '/loginView';
  static const kLearningContentScreen = '/learningContentScreen';
  static const kLettersScreen = '/lettersScreen';
  static const kNumberScreen = '/numbersScreen';
  static const kWordsScreen = '/wordsScreen';
  static const kTestScreen = '/testScreen';
  static const kSignUpView = '/SignUpView';
  static const kProfileView = '/profileView';
  static const kExamScreen = '/examScreen';
  static const kLettersExamScreen = '/lettersExamScreen';
  static const kNumbersExamScreen = '/numbersExamScreen';
  static const kWordsExamScreen = '/wordsExamScreen';
  static const kPasswordRecoveryView = '/passwordRecoveryView';
  static const kVerificationCodeView = '/verificationCodeView';

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
        builder: (context, state) => LearningContentScreen(),
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
        builder: (context, state) => WordsContentScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(
            // userData: state.extra as AuthApiSuccessResponse,
            ),
      ),
      GoRoute(
        path: kTestScreen,
        builder: (context, state) => const TestScreen(),
      ),
      GoRoute(
        path: kPasswordRecoveryView,
        builder: (context, state) => const PasswordRecoveryView(),
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
        builder: (context, state) => ProfileView(),
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) => const VerificationCodeView(),
      ),
    ],
  );
}
