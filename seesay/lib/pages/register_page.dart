import 'package:flutter/material.dart';
import 'package:seesay/components/my_button.dart';
import 'package:seesay/components/my_textfield.dart';
import 'package:seesay/components/square_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seesay/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onLogin;
  const RegisterPage({super.key, required this.onLogin});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: ((context) {
        return const Center(child: CircularProgressIndicator());
      }),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      showErrorMesssage("Passwords do not match");
      return;
    }
    try {
      //check if password is confirmed

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMesssage(e.code);
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

                //Let's create an account for you
                const Text(
                  'Let\'s create an account for you!',
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

                //confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                //sign in button
                const SizedBox(
                  height: 25,
                ),

                MyButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                      imagePressed: () {},
                    ),
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    TextButton(
                      onPressed: widget.onLogin,
                      child: const Text(
                        'Login now',
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
