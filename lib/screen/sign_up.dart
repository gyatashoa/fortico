import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/auth_service.dart';
import 'package:fortico/utils/utils.dart';
import 'package:fortico/widgets/auth_btn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String get home => '/sign-up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

   Future onSignUp() async {
    var res = await getIt<AuthService>()
        .signup(email: emailController.text, password: passwordController.text);
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

    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, homeRoute,(route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: Utils.getHeight(context),
          child: SingleChildScrollView(
            child: SizedBox(
              height:  Utils.getHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(child: SizedBox.expand()),
                  SizedBox(height: Utils.getHeight(context)*.1,),
                  const Text('SIGN UP',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  SvgPicture.asset('assets/images/create_account.svg', 
                  height: Utils.getHeight(context) * .3,
                  width: double.infinity
                  ,),
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical :8.0),
                    child:  Text('Please Enter your email and password to create an account',
                    style: TextStyle(
                      color: Colors.black45
                    ),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email'
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                     decoration: const InputDecoration(
                      hintText: 'Password'
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthBtn(
                    text: 'Sign Up',
                    onTap: onSignUp,
                  
                  ),
                 InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'sign in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                                // Expanded(child: SizedBox.expand()),
                    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
