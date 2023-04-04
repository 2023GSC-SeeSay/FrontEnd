import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:seesay/services/practice/record.dart';
import 'package:seesay/services/api_service.dart';
import 'package:seesay/services/list_model.dart';

// const String gifUrlmouth = "gif/0_60_mouth.gif";
// const String gifUrltongue = "gif/0_60_tongue.gif";
// String word = "김밥";
// String read = "김빱";
// String tongueExp1 =
//     "김: Put the back of your tongue inside the roof of your mouth to block the air and make a sound. Put your tongue naturally and make a sound, close your mouth and block the air to pronounce it.";
// String tongueExp2 =
//     "빱: Close your mouth with your tongue in the middle, take off your lips and make a sound by spouting air. Put your tongue naturally and make a sound, close your mouth and block the air to pronounce it.";
// String mouthExp1 =
//     "김: After flattening the lips, put strength on the lips and pull the corners of the lips to both sides to pronounce it as a mouth shape that feels like a smile, but only the lips slightly fall off. At this time, both corners of your mouth should not come down, and be careful not to relax your entire lip.";
// String mouthExp2 =
//     "빱: Make the index finger, middle finger, and thumb into a triangle shape and put them in your mouth slightly. Put strength on your lips to fit these three fingers and drop your lower jaw to pronounce it. Let the mouth shape be a circle.";

class BasicPractice extends StatefulWidget {
  final String content;
  final String title;
  final String word;
  const BasicPractice({
    super.key,
    required this.content,
    required this.title,
    required this.word,
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
    Future<List<ListModel>> wordList = ApiService.getListModel(0);
    // int Pid = findPid(widget.word);
    // Future<PracticeModel> practiceModel = ApiService.getPracticeModel(0, Pid);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFCE4040),
        ),
      ),
      body: FutureBuilder(
          future: wordList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            int Pid = 0;
            for (int i = 0; i < snapshot.data!.length; i++) {
              if (snapshot.data![i].Text == widget.word) {
                Pid = snapshot.data![i].Pid;
                break;
              }
            }
            return FutureBuilder(
              future: ApiService.getPracticeModel(0, Pid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
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
                              widget.content,
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.Text,
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
                                  "[${snapshot.data!.Text}]",
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
                                  border: Border.all(
                                      color: const Color(0xFFCE4040)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _pageController.jumpToPage(0);
                                      _isPressed = 0;
                                    },
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(129, 35)),
                                      elevation:
                                          const MaterialStatePropertyAll(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.zero,
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.zero,
                                          ),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
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
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(129, 35)),
                                      elevation:
                                          const MaterialStatePropertyAll(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.zero,
                                            topRight: Radius.zero,
                                            bottomLeft: Radius.zero,
                                            bottomRight: Radius.zero,
                                          ),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
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
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(129, 35)),
                                      alignment: Alignment.center,
                                      elevation:
                                          const MaterialStatePropertyAll(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.zero,
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.zero,
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
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
                                          "assets/images/0_58_tongue.gif",
                                          width: 370,
                                          height: 200,
                                          fit: BoxFit.contain),
                                      // Image.network(
                                      //   snapshot.data!.GifTongueUrl,
                                      //   width: 370,
                                      //   height: 200,
                                      //   fit: BoxFit.contain,
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data!.TongueDesc,
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
                                          "assets/images/0_58_mouth.gif",
                                          width: 370,
                                          height: 315,
                                          fit: BoxFit.contain),
                                      // Image.network(
                                      //   snapshot.data!.GifTongueUrl,
                                      //   width: 370,
                                      //   height: 315,
                                      //   fit: BoxFit.contain,
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data!.MouthDesc,
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
                      ),
                    ],
                  );
                }

                return const Text("Loading");
              },
            );
          }),
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
