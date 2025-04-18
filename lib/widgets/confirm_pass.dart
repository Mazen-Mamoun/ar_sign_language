import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/password/reset%20password.dart';

class confirm_pass extends StatelessWidget {
  const confirm_pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar:  AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(20),

            ),
            child: IconButton(icon:Icon(Icons.arrow_back_ios,size: 20,), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>reset_password()));
            }, ),)
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("تمت إعادة تعيين كلمة المرور",textAlign: TextAlign.left,style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )),
            SizedBox(height: 35,),
            Text("تمت إعادة تعيين كلمة المرور بنجاح",style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),),
            Text("يمكنك الأن تسجيل الدخول بإستخدام كلمة المرور الجديدة",style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInView()));
                    }, child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
            ),
          ],
        ),

    );
  }
}
