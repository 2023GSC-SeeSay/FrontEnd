import 'package:flutter/material.dart';

class teamInfo extends StatelessWidget {
  const teamInfo({super.key});

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
        children: const [Text("김은진\n박정환\n조재원\n홍은빈")],
      ),
    );
  }
}
