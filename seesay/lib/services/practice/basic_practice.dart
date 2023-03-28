import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:seesay/services/practice/record.dart';

const String gifUrlmouth = "gif/0_60_mouth.gif";
const String gifUrltongue = "gif/0_60_tongue.gif";

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
                  textAlign: TextAlign.center,
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
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                Center(
                  child: explanationGif(
                    title: "혀 모양",
                    exp: "혀 모양에 대한 설명",
                    gifUrl: gifUrltongue,
                  ),
                ),
                Center(
                  child: explanationGif(
                    title: "입 모양",
                    exp: "입 모양에 대한 설명",
                    gifUrl: gifUrlmouth,
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

class explanationGif extends StatefulWidget {
  String title;
  String exp;
  String gifUrl;

  explanationGif({
    super.key,
    required this.title,
    required this.exp,
    required this.gifUrl,
    // required this.gif,
  });

  @override
  State<explanationGif> createState() => _explanationGifState();
}

class _explanationGifState extends State<explanationGif> {
  // final String gifUrlmouth = "gs://seesay.appspot.com/gif/test.gif";
  // final String gifUrlmouth = "gif/0_60_mouth.gif";
  // final String gifUrltongue = "gif/0_60_tongue.gif";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.exp,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: loadGifFromFirebase(widget.gifUrl),
                builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    //다운로드가 완료되었고, 데이터가 있다면 GIF 파일을 표시
                    print("snapshotdata: ${snapshot.data}");
                    print("snapshotdatapath: ${snapshot.data?.path ?? ''}");
                    // return CachedNetworkImage(
                    //   // imageUrl: snapshot.data?.path ?? '',
                    //   imageUrl: "gs://seesay.appspot.com/gif/test.gif",
                    //   placeholder: (context, url) =>
                    //       const CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) =>
                    //       const Icon(Icons.error),
                    // );
                    return Image.file(
                      snapshot.data!,
                      width: 400,
                      height: 300,
                      fit: BoxFit.contain,
                    );
                  } else {
                    return const CircularProgressIndicator(
                        color: Color(0xFFCE4040));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> loadGifFromFirebase(gifUrl) async {
    final Reference ref = FirebaseStorage.instance.ref().child(gifUrl);
    final File file =
        await DefaultCacheManager().getSingleFile(await ref.getDownloadURL());
    return file;
  }
}
