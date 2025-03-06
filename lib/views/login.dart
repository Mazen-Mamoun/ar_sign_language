import 'package:flutter/material.dart';

class login extends StatelessWidget {
   login({Key? key}) : super(key: key);
  GlobalKey<FormState> form=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: form ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("asset/image/WhatsApp Image 2025-02-27 at 8.30.03 PM.jpeg",height: 250,),
                Center(child: Text(" مرحبا بك في تواصل  ",style: TextStyle(color: Colors.blue,fontSize: 25,shadows:[Shadow(blurRadius: 1,)]),)
                ),
                Center(child: Text("..ترجمة لغه الاشارة الى كلمه والكلمه الى لغة الاشارة",style: TextStyle(color: Colors.grey),)),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0,right: 45,top: 8,bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("البريد الالكتروني",style:TextStyle(color: Colors.grey.shade500)) ,
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.grey.shade500,),
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100,),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100,),
                          borderRadius: BorderRadius.circular(25),
                        )
                    ),

                    validator: (value) {
                      if(value!.isEmpty){
                        return "is empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0,right: 45,top: 8,bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("كلمة السر",style:TextStyle(color: Colors.grey.shade500)) ,
                        prefixIcon: Icon(Icons.lock_outline,color: Colors.grey.shade500,),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey.shade500,),
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100,),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100,),
                          borderRadius: BorderRadius.circular(25),
                        )
                    ),

                    validator: (value) {
                      if(value!.isEmpty){
                        return "is empty";
                      }
                    },
                  ),
                ),
                Container(
                    height: 30,
                    alignment: Alignment.topRight,
                    padding:EdgeInsets.only(left: 45,right: 45) ,
                    child: TextButton(onPressed: (){}, child: Text("هل نسيت كلمة المرور؟",style: TextStyle(color:Colors.blue)),)),
                SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(left:40.0,right:40 ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                      onPressed: (){
                        if(form.currentState!.validate()){
                          print("done");
                        }
                      }, child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(height: 3,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: Text("انشاء حساب",style: TextStyle(color: Colors.blue))),
                    Text("ليس لديك حساب؟",style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ) );
  }
}
