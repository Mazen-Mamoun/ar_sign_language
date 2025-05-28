import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/widgets/profile_progress_card.dart';
import 'package:tawasel/widgets/customer_support_card.dart';
import 'package:tawasel/widgets/edit_profile_card.dart';
import 'package:tawasel/widgets/main_bottom_navigation_bar.dart';
import 'package:tawasel/widgets/profile_name_container.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    AuthApiSuccessResponse userData =
        BlocProvider.of<AuthCubit>(context).getUserData()!;

    bool isLoading = false;

   
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              isLoading = true;
            } else if (state is AuthFailure) {
              isLoading = false;

              snackBar(context, state.errorMessage);
            } else if (state is AuthSuccess) {
              isLoading = false;
              setState(() {
                userData = state.authApiSuccessData;
              });
              snackBar(context, 'تم التعديل بنجاح');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileNameContainer(
                          userData: userData,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 320,
                          child: EditProfileCard(
                            userData: userData,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const ProgressCard(),
                        const CustomerSupportCard(),
                        Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.red[800],
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'تسجيل الخروج',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(currentIndex: 2),
    );
  }
}
