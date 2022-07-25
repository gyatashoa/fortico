import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/widgets/auth_btn.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static String get home => '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            'assets/images/tap-image.jpg'
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                        ,color: Colors.grey,

                      ),
                      child: const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration.collapsed(hintText: 'Email'),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                        ,color: Colors.grey,

                      ),
                      child:  const TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration.collapsed(hintText: 'Password'),
                    ),
                    ),
                   
                    const SizedBox(
                      height: 20,
                    ),
                    AuthBtn(onTap: () async {
                      //TODO: Sign with firebase here
                      await Future.delayed(const Duration(seconds: 5));
                      // ignore: use_build_context_synchronously
                      await Navigator.pushNamedAndRemoveUntil(
                          context, homeRoute, (route) => false);
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
