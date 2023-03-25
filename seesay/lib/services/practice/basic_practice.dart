import 'package:flutter/material.dart';
import 'package:seesay/services/practice/record.dart';

class BasicPractice extends StatefulWidget {
  final String content;
  final String title;
  const BasicPractice({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  State<BasicPractice> createState() => _BasicPracticeState();
}

class _BasicPracticeState extends State<BasicPractice> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  int _isPressed = 0;

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
          Center(
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                Text(
                  // "~~를 발음해 봅시다",
                  widget.content,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 394,
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFCE4040)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _pageController.jumpToPage(0);
                          _isPressed = 0;
                        },
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(130, 35)),
                          elevation: const MaterialStatePropertyAll(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.zero,
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.zero,
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return _currentPageIndex == 0
                                  ? const Color(0xFFCE4040)
                                  : Colors.white;
                            },
                          ),
                        ),
                        child: Text(
                          'Tongue',
                          style: TextStyle(
                            color: (_isPressed == 0)
                                ? Colors.white
                                : const Color(0xFFCE4040),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 35,
                        color: const Color(0xFFCE4040),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pageController.jumpToPage(1);
                          _isPressed = 1;
                        },
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(130, 35)),
                          elevation: const MaterialStatePropertyAll(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.zero,
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return _currentPageIndex == 1
                                  ? const Color(0xFFCE4040)
                                  : Colors.white;
                            },
                          ),
                        ),
                        child: Text(
                          'Mouth',
                          style: TextStyle(
                            color: (_isPressed == 1)
                                ? Colors.white
                                : const Color(0xFFCE4040),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 35,
                        color: const Color(0xFFCE4040),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pageController.jumpToPage(2);
                          _isPressed = 2;
                        },
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(130, 35)),
                          alignment: Alignment.center,
                          elevation: const MaterialStatePropertyAll(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return _currentPageIndex == 2
                                  ? const Color(0XFFCE4040)
                                  : Colors.white;
                            },
                          ),
                        ),
                        child: Text(
                          'Practice',
                          style: TextStyle(
                            color: (_isPressed == 2)
                                ? Colors.white
                                : const Color(0xFFCE4040),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Center(
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(
                        child: Column(
                          children: const [
                            Text(
                              "혀 모양",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "혀 모양에 대한 설명",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(
                        child: Column(
                          children: const [
                            Text(
                              "입 모양",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "입모양",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: RecordPage(),
                  //   Scaffold(
                  //     body: Padding(
                  //       padding: const EdgeInsets.all(25),
                  //       child: Center(
                  //         child: Column(
                  //           children: const [
                  //             Text(
                  //               "발음 연습",
                  //               style: TextStyle(
                  //                 fontSize: 30,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             SizedBox(height: 10),
                  //             Text(
                  //               "발음 연습",
                  //               style: TextStyle(
                  //                 fontSize: 25,
                  //               ),
                  //             ),
                  //             SizedBox(height: 10),
                  //             // AudioRecorder(onStop: onStop),
                  //             RecordPage(),
                  //             // GestureDetector(
                  //             //   child: const Icon(
                  //             //     Icons.record_voice_over,
                  //             //     size: 100,
                  //             //     color: Colors.black,
                  //             //   ),
                  //             //   onTap: () {
                  //             //     Navigator.push(
                  //             //       context,
                  //             //       MaterialPageRoute(
                  //             //           builder: (context) => const RecordPage()),
                  //             //     );
                  //             //   },
                  //             // ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ),
              ],
              onPageChanged: (int pageIndex) {
                setState(() {
                  _currentPageIndex = pageIndex;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
