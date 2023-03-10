import 'package:flutter/material.dart';
import 'package:seesay/components/my_button.dart';
import 'package:seesay/components/my_textfield.dart';
import 'package:seesay/components/square_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seesay/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onSignUp;
  const LoginPage({super.key, required this.onSignUp});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    showDialog(
      context: context,
      builder: ((context) {
        return const Center(child: CircularProgressIndicator());
      }),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMesssage(getMessageFromErrorCode(e.code));
    }
  }

  String getMessageFromErrorCode(String error) {
    switch (error) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      default:
        return "Login failed. Please try again.";
    }
  }

  void showErrorMesssage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFCE4040),
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Text(
                  'SeeSay',
                  style: TextStyle(
                    fontFamily: 'Modak',
                    fontSize: 60,
                    color: Color(0xFFCE4040),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                //welcomeback

                const Text(
                  'Welcome back. you\'ve been missed!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                //username text field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                //password text field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),

                //sign in button
                const SizedBox(
                  height: 25,
                ),

                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),

                const SizedBox(
                  height: 50,
                ),
                //or continue with

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareTitle(
                        imagePath: 'assets/images/google_logo.png',
                        imagePressed: () => AuthService().signInWithGoogle()),
                    SquareTitle(
                        imagePath: 'assets/images/apple_logo.png',
                        imagePressed: () => {}),
                  ],
                ),
                //google + apple sign in buttons

                const SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    TextButton(
                      onPressed: widget.onSignUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                //not a member? sign up
              ],
            ),
          ),
        ),
      ),
    );
  }
}
