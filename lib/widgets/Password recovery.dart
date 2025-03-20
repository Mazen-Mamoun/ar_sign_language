import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/helper/CustomTextFormField.dart';
import 'package:sign_language/login/login.dart';
import 'package:sign_language/password/verification_code.dart';
import 'package:sign_language/password/verification_code_view.dart';

class Password_recovery extends StatelessWidget {
  Password_recovery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          )),
      body: Form(
          child: SingleChildScrollView(
        child: Form(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: 15,
            ),
            Text("إستعادة كلمة المرور",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 9,
            ),
            Text(
              "من فضلك أدخل بريدك الإلكتروني لإستعادة كلمة المرور",
              style: TextStyle(
                color: Color.fromRGBO(152, 152, 152, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              "البريد الإلكتروني",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "أدخل البريد الإلكتروني",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffECECEC)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffB3B3B3)),
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "is empty";
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff648DDC),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => verification_code_view()));
                  },
                  child: Text(
                    "ارسال رمز التحقق",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ]),
        ),
      )),
    );
  }
}
