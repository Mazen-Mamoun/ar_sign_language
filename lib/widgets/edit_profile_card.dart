import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/widgets/edit_card_button.dart';
import 'package:tawasel/widgets/edit_card_text_field.dart';

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({super.key, required this.userData});

  final AuthApiSuccessResponse userData;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey();
    String? email, name;

    return Form(
      key: form,
      child: Card(
        shadowColor: Colors.grey,
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.edit_note),
                  SizedBox(width: 10),
                  Text(
                    'تعديل البيانات الشخصية',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              EditCardTextField(
                onChanged: (newEmail) {
                  email = newEmail;
                },
                title: 'البريد الالكتروني:',
                textFieldData: userData.user.email,
                validatorText: 'ادخل البريد الالكتروني الجديد',
              ),
              const SizedBox(height: 30),
              EditCardTextField(
                onChanged: (newName) {
                  name = newName;
                },
                title: 'اسم المستخدم:',
                textFieldData: userData.user.name,
                validatorText: 'ادخل اسم المستخدم الجديد',
              ),
              const SizedBox(height: 25),
              EditCardButton(
                form: form,
                onTap: () async {
                  if (form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();

                    BlocProvider.of<AuthCubit>(context).updateUser(
                      email: email ?? userData.user.email,
                      name: name ?? userData.user.name,
                      token: userData.token,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
