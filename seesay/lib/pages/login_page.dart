import 'package:flutter/material.dart';
import 'package:seesay/components/google_login_button.dart';
import 'package:seesay/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFCE4040),
              ),
              alignment: Alignment.center,
              child: const Text(
                'SeeSay',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Modak',
                  fontSize: 80,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please login to use the service.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  MyButton(
                    onTap: () => AuthService().signInWithGoogle(),
                    text: 'Login with Google',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
