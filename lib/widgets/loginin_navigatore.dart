import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class loginin_navigator extends StatelessWidget {
  const loginin_navigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("لديك حساب بالفعل؟",style: TextStyle(color: Color(0xff6E6E7C),fontSize: 16,
          fontWeight: FontWeight.w600,),),
        
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          },
            child: Text("تسجيل الدخول",
                   style: TextStyle(color: Color(0xff648DDC),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
            )
        ),
       
      ],
    );
  }

  }

