import 'package:electra/Screens/Auth/forget_password.dart';
import 'package:electra/components/text_custom.dart';
import 'package:electra/components/text_form_coustom.dart';
import 'package:electra/services/api/auth_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

import '../../constents/colors_theme.dart';
import '../../constents/spaces.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  bool isPassword = false;
  bool hasAddress = false;
  bool isCarOwner = true;
  bool isStationOwner = false;
  bool isConsumer = true;
  // String UserType = 'CONSUMER';

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var screenV = MediaQuery.of(context).size.height;
    var screenH = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bGColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          kVSpace64,
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Electra",
                style: TextStyle(color: txtFieldColor, fontSize: 28),
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: txtFieldColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // const Align(
          //   alignment: AlignmentDirectional.center,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Text(
          //       "Register",
          //       style: TextStyle(
          //           color: txtFieldColor,
          //           fontSize: 50,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // const Align(
          //   alignment: AlignmentDirectional.center,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 8),
          //     child: Text(
          //       "on verifying the email belongs to you",
          //       style: TextStyle(color: txtFieldColor, fontSize: 20),
          //     ),
          //   ),
          // ),
          kVSpace24,
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "You Own:",
                style: TextStyle(
                    color: txtFieldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 36,
            width: screenH * 0.95,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              color: Colors.white,
              //___________________________ User Type ______________________
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCarOwner = !isCarOwner;
                        isStationOwner = !isStationOwner;
                        hasAddress = !hasAddress;
                        isConsumer = !isConsumer;
                      });
                    },
                    child: Container(
                      // margin: const EdgeInsets.all(2.0),
                      height: 36,
                      decoration: isCarOwner
                          ? BoxDecoration(
                              color: greenGradient,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade600,
                              //     spreadRadius: 1,
                              //     blurRadius: 7,
                              //     offset: const Offset(5, 5),
                              //   ),
                              //   const BoxShadow(
                              //       color: Colors.white,
                              //       offset: Offset(-5, -5),
                              //       blurRadius: 15,
                              //       spreadRadius: 1),
                              // ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  greenGradient,
                                  purpleGradient,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )
                          : null,
                      child: Center(
                          child: const Text(
                        "Electric car ",
                        style: TextStyle(
                            color: txtFieldColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCarOwner = !isCarOwner;
                        isStationOwner = !isStationOwner;
                        hasAddress = !hasAddress;
                        isConsumer = !isConsumer;
                      });
                    },
                    child: Container(
                      // margin: const EdgeInsets.all(2.0),
                      height: 36,
                      decoration: isStationOwner
                          ? BoxDecoration(
                              // color: greenGradient,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade600,
                              //     spreadRadius: 1,
                              //     blurRadius: 15,
                              //     offset: const Offset(5, 5),
                              //   ),
                              //   const BoxShadow(
                              //       color: Colors.white,
                              //       offset: Offset(-5, -5),
                              //       blurRadius: 15,
                              //       spreadRadius: 1),
                              // ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  greenGradient,
                                  purpleGradient,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )
                          : null,
                      child: Center(
                        child: const Text(
                          "Electric Station ",
                          style: TextStyle(
                              color: txtFieldColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  TextFormCoustom(
                    hint: 'Enter your name',
                    label: 'Name',
                    controller: nameController,
                  ),
                  TextFormCoustom(
                    hint: 'example@gmail.com',
                    label: 'Email',
                    controller: emailController,
                  ),
                  TextFormCoustom(
                    hint: 'Enter your password',
                    label: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  TextFormCoustom(
                    hint: 'Re-enter your password',
                    label: 'Confirm password',
                    isPassword: true,
                    controller: confirmPasswordController,
                  ),
                  TextFormCoustom(
                    hint: 'Enter Phone',
                    label: 'Phone',
                    controller: phoneController,
                  ),
                  // Visibility(
                  //     visible: hasAddress,
                  //     child: TextFormCoustom(
                  //       hint: 'Enter your address',
                  //       label: 'Address',
                  //       controller: addressController,
                  //     )),
                ],
              )),
          // Row(
          //   children: [
          //     Expanded(
          //       child: mTextField(
          //         isPassword: null,
          //         controller: firstNameController,
          //         hint: "First name",
          //         label: "name",
          //       ),
          //     ),
          //     Expanded(
          //       child: mTextField(
          //         isPassword: null,
          //         controller: lastNameController,
          //         hint: "Last Name",
          //         label: "Last",
          //       ),
          //     ),
          //   ],
          // ),
          // mTextField(
          //   isPassword: null,
          //   controller: emailController,
          //   hint: "example@gmail.com",
          //   label: "Email",
          // ),
          // mTextField(
          //   isPassword: null,
          //   controller: phoneController,
          //   hint: "Phone number",
          //   label: "Email",
          // ),
          // mTextField(
          //   isPassword: null,
          //   controller: passwordController,
          //   hint: "Password",
          //   label: "Password",
          // ),
          // mTextField(
          //   isPassword: null,
          //   controller: passwordController2,
          //   hint: "Confirm Password",
          //   label: "Password",
          // ),
          kVSpace16,
          // const Align(
          //   alignment: AlignmentDirectional.bottomStart,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Text(
          //       " Type Of User",
          //       style: TextStyle(
          //           color: txtFieldColor,
          //           fontSize: 16,
          //           fontWeight: FontWeight.normal),
          //     ),
          //   ),
          // ),
          // kVSpace16,
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   margin: EdgeInsets.symmetric(horizontal: 15),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12),
          //       color: txtFieldBGColor),
          //   child: DropdownButton<String>(
          //     underline: Container(),
          //     hint: Text("Choose your Type"),
          //     icon: Icon(
          //       Icons.arrow_drop_down_circle,
          //       color: iconsColor,
          //     ),

          //     itemHeight: 60,
          //     elevation: 0,
          //     isExpanded: true,

          //     style: TextStyle(fontSize: 24, color: txtFieldColor),
          //     padding: EdgeInsets.symmetric(horizontal: 15),
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         dropdownValue = newValue!;
          //       });
          //     },
          //     value: dropdownValue,
          //     // Step 4.
          //     items: <String>['PROVIDER', 'CONSUMER']
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(
          //           value,
          //           style: TextStyle(fontSize: 24),
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // ),
          // kVSpace16,
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ForgetPassword()),
                  (route) => false);
            },
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: TextCustom(
                          text: "Already Have an Account",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () {
                          context.pushAndRemove(view: LoginPage());
                        },
                      ),
                      // InkWell(
                      //   child: TextCustom(
                      //     text: " forget password?",
                      //     color: txtFieldColor,
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   onTap: () {
                      //     context.push(view: ForgetPassword());
                      //   },
                      // ),
                    ],
                  )),
            ),
          ),
          kVSpace16,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: buttontxtColor,
              backgroundColor: buttonBGColor,
              // foreground
              padding: const EdgeInsets.symmetric(horizontal: 16),

              minimumSize: Size(screenH * 0.9, 57),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onPressed: () async {
              print('im here');
              // todo
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const LoginPage()));

              // final Map body = {
              //   "email": emailController.text,
              //   "password": passwordController.text,
              //   "phone": passwordController.text,
              //   "bank-account": "3djasdasdas",
              //   // "username": username,
              //   // "name": nameController.text
              // };
              //
              // final response = await createAccount(body: body);
              // print(response.body);
              // if (response.statusCode == 200) {
              //   // Navigator.of(context).pushAndRemoveUntil(
              //   //     MaterialPageRoute(
              //   //         builder: (context) => HomeScreen()),
              //   //         (route) => false);
              //   print("Success");
              // }
              print(!isConsumer);
              if (!isConsumer) {
                print('im provider');
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (passwordController.text
                          .compareTo(confirmPasswordController.text) ==
                      0) {
                    final Map body = {
                      "phone": phoneController.text,
                      "password": passwordController.text,
                      "email": emailController.text,
                      "name": nameController.text,
                      "address": "", //addressController.text,
                      "bank_account": ""
                    };
                    lodingPage(context: context);
                    final response =
                        await createAccount(body: body, userType: 'PROVIDER');
                    if (response.statusCode == 200) {
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    } else if (response.statusCode == 422) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'This email is used please enter anoth email')));
                      setState(() {});
                    } else if (response.statusCode == 400) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Please enter correct email and Password')));
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter identical password')));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill the Signup form')));
                }
              }
              print(isConsumer);
              if (isConsumer) {
                print('im consumer');
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (passwordController.text
                      .contains(confirmPasswordController.text)) {
                    final Map body = {
                      "phone": phoneController.text,
                      "password": passwordController.text,
                      "email": emailController.text,
                      "name": nameController.text,
                      "address": "", //addressController,
                      "bank_account": ""
                    };
                    lodingPage(context: context);
                    final response =
                        await createAccount(body: body, userType: 'CONSUMER');
                    print(response.statusCode);
                    if (response.statusCode == 200) {
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    } else if (response.statusCode == 422) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'This email is used please enter anoth email')));
                      setState(() {});
                    } else if (response.statusCode == 400) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Please enter correct email and Password')));
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Please check that password is identecal')));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill the Signup form')));
                }
              }
            },
            child: const Text(
              'Signup',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          kVSpace16,
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const LoginPage(),
          //       ),
          //     );
          //   },
          //   child: const Align(
          //     alignment: AlignmentDirectional.center,
          //     child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          //         child: Text('data')),
          //   ),
          // ),
        ]),
      ),
    );
  }

  lodingPage({required BuildContext context}) {
    showDialog(
        context: context,
        barrierColor: const Color.fromARGB(0, 255, 255, 255),
        builder: (context) => const Center(child: CircularProgressIndicator()));
    // child: rive.RiveAnimation.asset('assets/icons/Electra.riv')));
  }
}
