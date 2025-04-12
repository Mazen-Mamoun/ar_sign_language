import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/widgets/auth_widgets/auth_navigation_text.dart';
import 'package:tawasel/widgets/auth_widgets/custom_auth_button.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_body.dart';
import 'package:tawasel/widgets/custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> form = GlobalKey();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  String? userName, email, password, confirmPassword;
  bool isLodaing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLodaing = true;
        } else if (state is AuthFailure) {
          isLodaing = false;

          snackBar(context, state.errorMessage);
        } else if (state is AuthSuccess) {
          isLodaing = false;

          userData = state.authApiSuccessData;

          snackBar(context, state.authApiSuccessData.message);

          GoRouter.of(context).push(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLodaing,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Image.asset("assets/images/sign_up_image.png", height: 250),
                    CustomTextFormField(
                      onChanged: (name) {
                        userName = name;
                      },
                      obscureText: false,
                      title: 'اسم المستخدم',
                      prefixIcon: Icons.person,
                      validatorText: 'ادخل اسم المستخدم الخاص بك',
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      onChanged: (mail) {
                        email = mail;
                      },
                      obscureText: false,
                      title: 'البريد الالكتروني',
                      prefixIcon: Icons.email_outlined,
                      validatorText: 'ادخل البريد الالكتروني الخاص بك',
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      onChanged: (pass) {
                        password = pass;
                      },
                      obscureText: !isPasswordVisible,
                      title: 'كلمة السر',
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {});
                        },
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.grey.shade500,
                      ),
                      validatorText: 'ادخل كلمة السر الخاصة بك',
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      onChanged: (pass) {
                        confirmPassword = pass;
                      },
                      obscureText: !isConfirmPasswordVisible,
                      title: 'تاكيد كلمة السر',
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: IconButton(
                        onPressed: () {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          setState(() {});
                        },
                        icon: isConfirmPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.grey.shade500,
                      ),
                      validatorText: 'ادخل كلمة السر الخاصة بك',
                    ),
                    const SizedBox(height: 20),
                    CusotmAuthButton(
                      form: form,
                      onPressed: () async {
                        if (form.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).registerUser(
                            name: userName!,
                            email: email!,
                            password: password!,
                            confirmPassword: confirmPassword!,
                          );
                          FocusScope.of(context).unfocus();
                        }
                      },
                      title: 'انشاء حساب',
                    ),
                    const SizedBox(height: 10),
                    AuthNavigationText(
                      text: 'لديك حساب بالفعل',
                      textButton: 'تسجيل الدخول',
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                    ),
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
