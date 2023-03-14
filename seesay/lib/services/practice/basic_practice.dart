import 'package:flutter/material.dart';

class BasicPractice extends StatelessWidget {
  final String content;
  final String title;
  const BasicPractice({
    super.key,
    required this.title,
    required this.content,
  });

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "기본 발음 연습",
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xFFCE4040).withOpacity(0.3),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
