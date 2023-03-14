import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '$userName님, 오늘도',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const Text(
                  'SeeSay',
                  style: TextStyle(
                    fontFamily: 'Modak',
                    fontSize: 74,
                    color: Color(0xFFCE4040),
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage(
                'assets/images/plant0.png',
              ),
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
