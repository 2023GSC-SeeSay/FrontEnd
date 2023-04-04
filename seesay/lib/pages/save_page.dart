import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

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
        children: [
          const Text(
            "Library",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFCE4040),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Added Successfully!",
            style: TextStyle(
              color: Color(0xFFCE4040),
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "go to library to see your word",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Text(
            "",
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: Image.asset("assets/images/MovingSeeSayBig.gif"),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.all(19.0),
            child: GotoHomeButton(),
          ),
        ],
      ),
    );
  }
}

class GotoHomeButton extends StatelessWidget {
  const GotoHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[800],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Got it",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
