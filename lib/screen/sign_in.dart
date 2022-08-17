// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/auth_service.dart';
import 'package:fortico/utils/utils.dart';
import 'package:fortico/widgets/auth_btn.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String get home => '/sign-in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  Future onSignIn() async {
    var res = await getIt<AuthService>()
        .signin(email: emailController.text, password: passwordController.text);
    if (res is String) {
      //error occured, show a dialog box
      // debugPrint(res);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Error'),
                content: Text(res),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    }

    Navigator.pushReplacementNamed(context, homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          // height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(child: SizedBox.expand()),
                SizedBox(
                  height: Utils.getHeight(context) * .08,
                ),
                const Text(
                  'FORTICO',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                LottieBuilder.asset(
                  'assets/animations/dripping-water-faucet.json',
                  height: Utils.getHeight(context) * .35,
                ),
                // SvgPicture.asset('assets/images/create_account.svg',
                // height: Utils.getHeight(context) * .3,
                // width: double.infinity
                // ,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Please Enter your email and password to login in your account',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthBtn(
                  text: 'Sign In',
                  onTap: onSignIn,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(signUpRoute);
                  },
                  child: const Text(
                    'sign up',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
                // Expanded(child: SizedBox.expand()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
