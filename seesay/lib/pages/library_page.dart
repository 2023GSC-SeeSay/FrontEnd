import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "서재 Library",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFCE4040),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "내 서재",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 180,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const AddPage()),
                      //     );
                      //   },
                      //   child:
                      Container(
                        alignment: Alignment.center,
                        height: 28,
                        width: 72,
                        decoration: BoxDecoration(
                          color: const Color(0xFFCE4040),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "+ 추가",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
