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
        body: Center(
          child: Column(
            children: [
              const Text(
                "We made SeeSay",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCE4040),
                ),
              ),
              const Text(
                "About us",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: const [
                    Text(
                      "Welcome to Seesay!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " Our goal is to help people with hearing impairments to learn and practice pronunciation. We provide speaking practices with both graphic and written example and AI-based scoring system. Anyone can use our app to learn how to pronounce and practice their speaking by recording their voice. We use AI model to recognize the users' voice and pronunciation and compare to the standard pronunciation. \n\nWe are trying to make it more easier for those with hearing difficulties to communicate others and express themselves by spoken words. We believe that if we listen to the difficulties around us, our society will become more inclusive and we will be able to care for each other.\n\nOur team is made up of 4 people from Korea University in Korea. Jaewon Cho, leader of the team, is currently interested in flutter, artificial intelligence. Eunjin Kim is also interested in flutter. Junghwan Park is enthusiasitic about natural language processing and its applications. Eunbeen Hong is interested in computer vision models. If you have any questions or feedback, contact us by email.\n\nseesay.planb@gmail.com",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
