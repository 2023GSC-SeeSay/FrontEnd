import 'package:flutter/material.dart';

class feedbackPage extends StatelessWidget {
  const feedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFCE4040),
        ),
      ),
      body: Column(children: const [
        Text(
          "FeedBack Page",
          style: TextStyle(fontSize: 50),
        )
      ]),
    );
  }
}
