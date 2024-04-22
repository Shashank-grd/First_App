import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() =>_ForgotPasswordState();

}
class _ForgotPasswordState extends State<ForgotPassword> {
  
  TextEditingController email=TextEditingController();
 forgotpassword(String email) async{
   if(email==""){
     return customalertBox(context, "Enter the Required Fields");
   }
   else{
     customalertBox(context, "Verification mail sent");
     FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
            child: Column(
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      label:const Text('Email'),
                      suffix: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)
                      )
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  forgotpassword(email.text.toString());

                },child: Text("Reset Password",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
}
