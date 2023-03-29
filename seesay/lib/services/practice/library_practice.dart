import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:seesay/services/practice/record.dart';

const String gifUrlmouth = "gif/0_60_mouth.gif";
const String gifUrltongue = "gif/0_60_tongue.gif";
String title = "Subway Station";
String word = "강남역";
String read = "강남역";
String tongueExp1 =
    "강: Put the back of your tongue inside the roof of your mouth to block the air and make a sound. Put the back of your tongue inside the roof of your mouth and pronounce it long.";
String tongueExp2 =
    "남: Put the tip of the tongue on the gums behind the front teeth and make a sound by spouting air. Put your tongue naturally and make a sound, then close your mouth and make a long sound.";
String tongueExp3 =
    "역: Put the tip of the tongue on the gums behind the front teeth and make a sound by spouting air. While making a sound, put the back of your tongue inside the roof of your mouth to block the air and pronounce it.";
String mouthExp1 =
    "강: Make the index finger, middle finger, and thumb into a triangle shape and put them in your mouth slightly. Put strength on your lips to fit these three fingers and drop your lower jaw to pronounce it. Let the mouth shape be a circle.";
String mouthExp2 =
    "남: Make the index finger, middle finger, and thumb into a triangle shape and put them in your mouth slightly. Put strength on your lips to fit these three fingers and drop your lower jaw to pronounce it. Let the mouth shape be a circle.";
String mouthExp3 =
    "역: After flattening the lips, put strength on the lips and pull the corners of the lips to both sides to pronounce it as a mouth shape that feels like a smile, but only the lips slightly fall off. At this time, both corners of your mouth should not come down, and be careful not to relax your entire lip.\n Make the index finger, middle finger, and thumb into a triangle shape and put them in your mouth slightly. Put strength on the lips and drop the lower jaw so that these three fingers go in. Let the mouth shape be an oval. ";

class LibraryPractice extends StatefulWidget {
  final String content;
  final String title;
  const LibraryPractice({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  State<LibraryPractice> createState() => _LibraryPracticeState();
}

class _LibraryPracticeState extends State<LibraryPractice> {
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
                  "Library Practice",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      word,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCE4040),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "[$read]",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                              MaterialStateProperty.all(const Size(129, 35)),
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
                              MaterialStateProperty.all(const Size(129, 35)),
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
                              MaterialStateProperty.all(const Size(129, 35)),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "Tongue Position",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'assets/images/0_55_tongue.gif',
                            width: 370,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            tongueExp1,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            tongueExp2,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            tongueExp3,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      // child: explanationGif(
                      //   title: "혀 모양",
                      //   exp: "혀 모양에 대한 설명",
                      //   gifUrl: gifUrltongue,
                      // ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "Mouth Shape",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'assets/images/0_55_mouth.gif',
                            width: 370,
                            height: 315,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            mouthExp1,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            mouthExp2,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            mouthExp3,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      // child: explanationGif(
                      //   title: "입 모양",
                      //   exp: "입 모양에 대한 설명",
                      //   gifUrl: gifUrlmouth,
                      // ),
                    ),
                  ),
                  Center(
                    child: RecordPage(from: false),
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
                    return SizedBox(
                      width: 370,
                      height: 300,
                      child: Image.file(
                        snapshot.data!,
                        fit: BoxFit.contain,
                      ),
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
