import 'package:flutter/material.dart';

class ImageAdd extends StatelessWidget {
  const ImageAdd({super.key});

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
                "SeeSay",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCE4040),
                ),
              ),
              Text(
                "사진 촬영",
                style: TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
