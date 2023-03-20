import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Logout extends StatelessWidget {
  Logout({super.key}) {
    signUserOut();
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    signUserOut();
    return const Placeholder();
  }
}
