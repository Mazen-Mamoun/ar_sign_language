import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/helper/constants.dart';
import 'package:tawasel/widgets/custom_auth_button.dart';
import 'package:tawasel/widgets/custom_text_form_field.dart';
import 'package:tawasel/widgets/auth_navigation_text.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> form = GlobalKey();

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset("assets/images/login_image.png", height: 250),
            Text(
              "مرحبا بك في تواصل",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                shadows: const [Shadow(blurRadius: 1)],
              ),
            ),
            const SizedBox(height: 5),
            const Opacity(
              opacity: 0.7,
              child: Text(
                "ترجمة لغه الاشارة الى كلمه والكلمه الى لغة الاشارة..",
                style: TextStyle(
                  color: Color(0xff6E6E7C),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              obscureText: false,
              title: 'البريد الالكتروني',
              prefixIcon: Icons.email_outlined,
              validatorText: 'ادخل البريد الالكتروني الخاص بك',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              obscureText: !isPasswordVisible,
              title: 'كلمة المرور',
              prefixIcon: Icons.lock_outlined,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                color: Colors.grey.shade500,
              ),
              validatorText: 'ادخل كلمة المرور الخاصة بك',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kPasswordRecoveryView);
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CusotmAuthButton(
              form: form,
              title: 'تسجيل الدخول',
              onPressed: () {
                if (form.currentState!.validate()) {
                  snackBar(context, 'تم تسجيل الدخول بنجاح');
                  FocusScope.of(context).unfocus();
                  GoRouter.of(context).push(AppRouter.kHomeView);
                }
              },
            ),
            const SizedBox(height: 10),
            AuthNavigationText(
              text: 'ليس لديك حساب؟',
              textButton: 'انشاء حساب',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignUpView);
              },
            )
          ],
        ),
      ),
    );
  }
}
