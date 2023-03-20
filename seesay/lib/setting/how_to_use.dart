import 'package:flutter/material.dart';

class howToUse extends StatefulWidget {
  const howToUse({super.key});

  @override
  State<howToUse> createState() => _howToUseState();
}

class _howToUseState extends State<howToUse> {
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
                const Text(
                  "Tutorial",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                const Text(
                  "User's Guide",
                  style: TextStyle(fontSize: 30, color: Colors.black),
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
                              // side: BorderSide(
                              //   color: Color(0xFFCE4040),
                              // ),
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
                          'Practice',
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
                              // side: BorderSide(
                              //   color: Color(0xFFCE4040),
                              // ),
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
                          'Library',
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
                              // side: BorderSide(
                              //   color: Color(0xFFCE4040),
                              // ),
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
                          'Add',
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
                              "You can practice Basic Pronounciation",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Learn the required pronunciation step by step. You can practice pronunciation by looking at the explanation and mouth shape simulator provided in each step. After pressing the recording button, you can submit a recording and view feedback. Improve pronunciation accuracy with feedback!",
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
                              "You can check the saved sentences",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You can practice pronunciation with saved sentences. Check out the Add tab to learn how to add sentences to your study. You can delete saved sentences from the study. Practice the sentences you want anytime, anywhere!",
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
                              "You can add any sentence you want",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You can add sentences by three ways. Direct input can be done by typing on your phone, taking pictures of sentences, and uploading text files.",
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
