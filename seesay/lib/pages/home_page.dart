import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '000님, 오늘도',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(
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
          flex: 2,
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
