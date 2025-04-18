import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/helper/CustomTextFormField.dart';
import 'package:sign_language/login/LogInView.dart';
import 'package:sign_language/password/confirm_pass.dart';
import 'package:sign_language/password/verification_code_view.dart';

class reset_password extends StatefulWidget {
  const reset_password({Key? key}) : super(key: key);

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(20),

            ),
            child: IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            }, ),)
      ),

      body: Form(child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            child:Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text("إعادة تعيين كلمة المرور",textAlign: TextAlign.left,style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )),
              SizedBox(height: 9,),
              Text("من فضلك أدخل كلمة المرور الجديدة",style: TextStyle(
                color: Color.fromRGBO(152, 152, 152, 1),
                fontSize: 14,
                //fontWeight: FontWeight.w700,
              ),),
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 33),
                child: Text("كلمة المرور",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),),
              ),
              SizedBox(height: 9,),

              CustomTextFormField(
                obscureText: false,
                  title: "كملة المرور الجديدة",
                  validatorText: "كملة المرور الجديدة",
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
                ),
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 12),
                child: Text("تأكيد كلمة المرور",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),),
              ),
              CustomTextFormField(
                title: "تأكيد كلمة المرور الجديدة",
                validatorText: "تأكيد كلمة المرور الجديدة",
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
                ), obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff648DDC)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>confirm_pass()));
                    }, child: Text("إعادة تعيين",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
            ]
        ),
            ) ,),
      )));
  }
}
