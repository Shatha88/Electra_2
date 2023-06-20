import 'dart:convert';

import 'package:electra/Screens/Auth/forget_password.dart';
import 'package:electra/Screens/Auth/signup_page.dart';
import 'package:electra/Screens/Consumer/con_home.dart';
import 'package:electra/Screens/Provider/screens.dart';
//import 'package:electra/Screens/Auth/forgetpassword.dart';
import 'package:electra/components/text_form_coustom.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

// import '../../components/mTextField.dart';
import '../../constents/colors_theme.dart';
import '../../constents/spaces.dart';
import '../../services/api/auth_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isPassword = false;

  @override
  Widget build(BuildContext context) {
    // var screenV = MediaQuery.of(context).size.height;
    var screenH = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              kVSpace64,
              kVSpace64,
              const Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Electra",
                    style: TextStyle(color: txtFieldColor, fontSize: 32),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: txtFieldColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              kVSpace32,
              TextFormCoustom(
                hint: "example@gmail.com",
                label: "Email",
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return '';
                },
              ),
              kVSpace16,
              TextFormCoustom(
                hint: "********",
                label: "Password",
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  }
                  return '';
                },
              ),
              kVSpace16,
              // _________________________ Go to Forgot Password _______________
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgetPassword(),
                    ),
                  );
                },
                child: const Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      " forgot password?",
                      style: TextStyle(
                          color: txtFieldColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              kVSpace16,
              // _______________________ Login Button _________________________
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                  // foreground
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  minimumSize: Size(screenH * 0.9, 57),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   return;
                  // }
                  // _formKey.currentState!.save();

                  final Map body = {
                    'email': emailController.text,
                    'password': passwordController.text,
                  };
                  print('Im here');
                  final response = await loginAccount(body: body);
                  if (response.statusCode == 200) {
                    box.write('token', json.decode(response.body)['token']);
                    box.write(
                        'UserType', json.decode(response.body)['UserType']);
                    if (mounted) {
                      if (box
                          .read('UserType')
                          .toString()
                          .contains('CONSUMER')) {
                        context.pushAndRemove(view: ConHome());
                      }
                      if (box
                          .read('UserType')
                          .toString()
                          .contains('PROVIDER')) {
                        context.pushAndRemove(view: Screens());
                      }
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              kVSpace16,
              kVSpace16,
              kVSpace16,
              Row(children: [
                const Align(
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 8),
                    child: Text(
                      " Don't have an account?",
                      style: TextStyle(
                          color: txtFieldColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Click Here",
                    style: TextStyle(
                        color: txtFieldColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
