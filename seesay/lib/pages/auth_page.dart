import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seesay/pages/root_page.dart';
import 'package:seesay/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RootPage(
              userEmail: snapshot.data!.email!,
              userName: snapshot.data!.displayName!,
              photoURL: snapshot.data!.photoURL!,
            );
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
