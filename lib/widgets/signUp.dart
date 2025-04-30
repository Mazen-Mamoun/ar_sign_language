import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/widgets/auth_widgets/auth_navigation_text.dart';
import 'package:tawasel/widgets/auth_widgets/custom_auth_button.dart';
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

          snackBar(context, state.authApiSuccessData.message);

          GoRouter.of(context).push(
            AppRouter.kHomeView,
          );
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
                      title: 'اسم المستخدم',
                      validatorText: 'ادخل اسم المستخدم الخاص بك',
                      obscureText: false,
                      prefixIcon: Icons.person,
                      onChanged: (name) {
                        userName = name;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      title: 'البريد الالكتروني',
                      validatorText: 'ادخل البريد الالكتروني الخاص بك',
                      obscureText: false,
                      prefixIcon: Icons.email_outlined,
                      onChanged: (mail) {
                        email = mail;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      title: 'كلمة السر',
                      validatorText: 'ادخل كلمة السر الخاصة بك',
                      obscureText: !isPasswordVisible,
                      prefixIcon: Icons.lock_outlined,
                      onChanged: (pass) {
                        password = pass;
                      },
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
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      title: 'تاكيد كلمة السر',
                      validatorText: 'ادخل كلمة السر الخاصة بك',
                      obscureText: !isConfirmPasswordVisible,
                      prefixIcon: Icons.lock_outlined,
                      onChanged: (pass) {
                        confirmPassword = pass;
                      },
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
                    ),
                    const SizedBox(height: 20),
                    CusotmAuthButton(
                      title: 'انشاء حساب',
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
