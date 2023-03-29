import 'package:flutter/material.dart';
import 'package:seesay/pages/words_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final int totalIndex = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   toolbarHeight: 100,
          //   // titleSpacing: 100,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   // surfaceTintColor: Colors.white,
          //   title: Column(
          //     children: const [
          //       Text(
          //         "Practice",
          //         style: TextStyle(
          //             fontSize: 20,
          //             color: Color(0xFFCE4040),
          //             fontWeight: FontWeight.normal),
          //       ),
          //       SizedBox(height: 5),
          //       Text(
          //         "Basic Pronounciation",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 33,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //     ],
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Practice",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Basic Pronounciation",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('problems/basic_problems/list')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WordPage(
                                      doc: doc,
                                    ),
                                  ),
                                );
                              },
                              child: RealPractice(
                                  index: index + 1,
                                  title: doc['title'],
                                  intro: doc['intro']),
                            ),
                            if (index != docs.length - 1) const Lines(),
                          ],
                        );

                        //     return Container(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Text(
                        //         docs[index]['text'],
                        //         style: const TextStyle(fontSize: 20.0),
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                    );
                  },
                ),
                // for (int i = 0; i <= totalIndex; i++)
                // Column(
                //   children: [
                //     RealPractice(
                //       index: i,
                //     ),
                //     if (i != totalIndex) const Lines(),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Lines extends StatelessWidget {
  const Lines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          height: 30,
          width: 0.5,
          color: const Color(0xFFCE4040),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          height: 0.5,
          width: 289,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class RealPractice extends StatelessWidget {
  final String title;
  final String intro;
  RealPractice({
    super.key,
    required this.index,
    required this.title,
    required this.intro,
  });

  late int index;
  // final List<String> contents = [
  //   "Begin",
  //   "Basic 1",
  //   "Basic 2",
  //   "Basic Words 1",
  //   "Basic Words 2",
  //   "기본 단어 3",
  //   "기본 문장 1",
  //   "기본 문장 2",
  //   "기본 문장 3",
  // ];
  // final List<String> contentsDetail = [
  //   "Welcome to SeeSay",
  //   "Let's pronounce the consonants",
  //   "Let's pronounce the vowels",
  //   "한글의 자음에 대해 알아봅시다",
  //   "한글의 기본글자를 발음해 봅시다",
  //   "동물을 발음해 봅시다",
  //   "음식을 발음해 봅시다",
  //   "장소를 발음해 봅시다",
  //   "자기소개 문장을 발음해 봅시다",
  //   "음식을 주문해 봅시다",
  //   "생각을 전달해 봅시다",
  // ];
  // final List moveToPracticePage = [
  //   const Practice0(title: '시작', content: 'SeeSay에 오신 걸 환영합니다'),
  //   const Practice1(),
  //   const Practice2(),
  //   const Practice3(),
  //   const Practice4(),
  //   const Practice5(),
  //   const Practice6(),
  //   const Practice7(),
  //   const Practice8(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFCE4040).withOpacity(0.3),
          ),
          child: Text(
            index < 10 ? "0$index" : "$index",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              // contents[index],
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              intro,
              // contentsDetail[index],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
