import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/provider/user_provider.dart';
import 'package:movie_app/screens/bottom_nav.dart/bottom_nav_screen.dart';
import 'package:movie_app/screens/login_signup/signup.dart';
import 'package:movie_app/screens/login_signup/widgets/login_button_widget.dart';
import 'package:movie_app/screens/login_signup/widgets/login_text_form_field_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.2,
                      left: MediaQuery.of(context).size.width * 0.2,
                      right: MediaQuery.of(context).size.width * 0.2,
                      bottom: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Image.asset("assets/movies.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                LoginTextFormFieldWidget(
                  controller: emailcontroller,
                  hintText: "email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !isValidEmail(value)) {
                      return "";
                    }
                    return null;
                  },
                ),
                LoginTextFormFieldWidget(
                  controller: passwordcontroller,
                  hintText: "password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  password: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return "";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Column(
                  children: [
                    Provider.of<UserProvider>(context).loading
                        ? CircularProgressIndicator(
                            color: AppColors.gold,
                          )
                        : LoginButtonWidget(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Provider.of<UserProvider>(context,
                                        listen: false)
                                    .login(emailcontroller.text,
                                        passwordcontroller.text)
                                    .then((value) {
                                  Navigator.of(context).pushReplacementNamed(
                                      BottomNavScreen.routeName);
                                });
                              }
                            },
                            text: "Log in"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't you have an Account?",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignupScreen.routeName);
                            },
                            child: Text(
                              "signup",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.gold),
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
