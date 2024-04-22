import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Otpscreen extends StatefulWidget {
  String verificationid;
  Otpscreen({super.key, required this.verificationid});
  @override
  State<Otpscreen> createState() => _OTPscreen();
}

class _OTPscreen extends State<Otpscreen> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP SCREEN"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otp,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter the OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationid,
                          smsCode: otp.text.toString());

                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      }
                  );
                } catch (ex) {
              log(ex.toString());
                }
              },
              child: Text("Confirm"))
        ],
      ),
    );
  }
}
