import 'package:flutter/material.dart';

class Practice0 extends StatelessWidget {
  const Practice0({super.key});

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
                "SeeSay에 오신 걸 환영합니다",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCE4040),
                ),
              ),
              Text(
                "시작",
                style: TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
