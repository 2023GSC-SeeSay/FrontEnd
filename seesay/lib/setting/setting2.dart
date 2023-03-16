import 'package:flutter/material.dart';

class setting2 extends StatelessWidget {
  const setting2({super.key});

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
      body: Column(
        children: const [Text("설정 페이지")],
      ),
    );
  }
}
