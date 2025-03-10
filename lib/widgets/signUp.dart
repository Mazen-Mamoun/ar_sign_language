import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/login.dart';
import 'package:sign_language/loginin_navigatore.dart';

import 'CustomTextFormField.dart';

class signUp extends StatelessWidget {
   signUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    body:
      Form(
      key: form,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset("asset/image/register.png",height: 250,),
            const SizedBox(height: 20),
            const CustomTextFormField(
              title: 'اسم المستخدم',
              preficIcon: Icons.person,
              validatorText: 'ادخل اسم المستخدم الخاص بك',
            ),
            const SizedBox(height: 15),
            const CustomTextFormField(
              title: 'البريد الالكتروني',
              preficIcon: Icons.email_outlined,
              validatorText: 'ادخل البريد الالكتروني الخاص بك',
            ),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              title: 'كلمة السر',
              preficIcon: Icons.lock_outlined,
              suffixIcon: Icons.visibility,
              validatorText: 'ادخل كلمة السر الخاصة بك',
            ),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              title: 'تاكيد كلمة السر',
              preficIcon: Icons.lock_outlined,
              suffixIcon: Icons.visibility,
              validatorText: 'ادخل كلمة السر الخاصة بك',
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff648DDC)
                ),
                  onPressed: (){}, child: Text("انشاء حساب",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            SizedBox(
              height: 20,
            ),
            loginin_navigator(),
            const SizedBox(height: 10),
          ],
        ),
      ),));
  }
}
