import 'package:flutter/material.dart';
import 'package:seesay/pages/login_page.dart';
import 'package:seesay/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrResgisterPageState();
}

class _LoginOrResgisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onSignUp: togglePages);
    } else {
      return RegisterPage(onLogin: togglePages);
    }
  }
}
