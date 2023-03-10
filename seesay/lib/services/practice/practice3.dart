import 'package:flutter/material.dart';

class Practice3 extends StatelessWidget {
  const Practice3({super.key});

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
      body: Center(
        child: Container(
          child: Column(
            children: const [
              Text(
                "기본 발음 연습",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCE4040),
                ),
              ),
              Text(
                "기본 단어 1",
                style: TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
