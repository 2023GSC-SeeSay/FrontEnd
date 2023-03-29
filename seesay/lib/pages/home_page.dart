import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Hello $userName,',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const Text(
                  'SeeSay',
                  style: TextStyle(
                    fontFamily: 'Modak',
                    fontSize: 74,
                    color: Color.fromARGB(255, 198, 7, 7),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 450,
            alignment: Alignment.center,
            child: const Image(
              width: 300,
              image: AssetImage(
                // 'assets/images/plant0.png',
                'assets/images/MovingSeeSayBig.gif',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
