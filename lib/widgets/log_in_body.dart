import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/constants.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/widgets/custom_text_form_field.dart';
import 'package:tawasel/widgets/sign_up_navigation_text.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> form = GlobalKey();

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
              title: 'البريد الالكتروني',
              preficIcon: Icons.email_outlined,
              validatorText: 'ادخل البريد الالكتروني الخاص بك',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              title: 'كلمة المرور',
              preficIcon: Icons.lock_outlined,
              suffixIcon: Icons.visibility,
              validatorText: 'ادخل كلمة المرور الخاصة بك',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  if (form.currentState!.validate()) {
                    snackBar(context, 'تم تسجيل الدخول بنجاح');
                  }
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                child: const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const SignUpNavigationText(),
          ],
        ),
      ),
    );
  }
}
