import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/widgets/auth_widgets/custom_auth_button.dart';
import 'package:tawasel/widgets/auth_widgets/forget_password_text_button.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_welcome_section.dart';
import 'package:tawasel/widgets/auth_widgets/custom_text_form_field.dart';
import 'package:tawasel/widgets/auth_widgets/auth_navigation_text.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> form = GlobalKey();

  bool isPasswordVisible = true;
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthFailure) {
          isLoading = false;

          snackBar(context, state.errorMessage);
        } else if (state is AuthSuccess) {
          isLoading = false;

          snackBar(context, 'Login Successfully');

          GoRouter.of(context).pushReplacement(
            AppRouter.kHomeView,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const LogInWelcomeSection(),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      title: 'البريد الالكتروني',
                      validatorText: 'ادخل البريد الالكتروني الخاص بك',
                      prefixIcon: Icons.email_outlined,
                      obscureText: false,
                      onChanged: (mail) {
                        email = mail;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      title: 'كلمة المرور',
                      validatorText: 'ادخل كلمة المرور الخاصة بك',
                      obscureText: !isPasswordVisible,
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isPasswordVisible = !isPasswordVisible;
                            },
                          );
                        },
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.grey.shade500,
                      ),
                      onChanged: (pass) {
                        password = pass;
                      },
                    ),
                    const SizedBox(height: 10),
                    const ForgetPasswordTextButton(),
                    const SizedBox(height: 15),
                    CusotmAuthButton(
                      title: 'تسجيل الدخول',
                      form: form,
                      onPressed: () async {
                        if (form.currentState!.validate()) {
                          FocusScope.of(context).unfocus();

                          BlocProvider.of<AuthCubit>(context).loginUser(
                            email: email!,
                            password: password!,
                          );
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
            ),
          ),
        );
      },
    );
  }
}
