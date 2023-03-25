import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seesay/pages/content_add_page.dart';
import 'package:seesay/services/practice/library_practice.dart';

class LibraryPage extends StatefulWidget {
  final Function() gotoAddPage;

  const LibraryPage({
    super.key,
    required this.gotoAddPage,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> titles = [
    '스타벅스 주문',
    "자기소개",
    "구글 솔루션 챌린지",
    "길 묻기",
  ];

  List<String> keywords = [
    '아메리카노, 자바칩프라푸치노',
    "이름, 나이, 거주지",
    "팀 이름, 팀원 소개, 아이디어 소개",
    "가는 길, 걸리는 시간",
  ];

  // List moveToPracticePage = [
  //   const Practice0(
  //     title: '스타벅스 주문',
  //     content: '아메리카노, 자바칩프라푸치노',
  //   ),
  //   const Practice1(),
  //   const Practice2(),
  //   const Practice3(),
  // ];

  // void updatePreview({title, keyword}) {
  //   setState(() {
  //     titles.add(title);
  //     keywords.add(keyword);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // if (widget.newtitle != null && widget.newkeyword != null) {
    //   updatePreview(
    //     title: widget.newtitle,
    //     keyword: widget.newkeyword,
    //   );
    //   widget.newtitle = null;
    //   widget.newkeyword = null;
    // }

    return Padding(
      padding: const EdgeInsets.all(19),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Library",
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
                              "My Library",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 180,
                            // ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContentAddPage(),
                                  ),
                                );
                                // const Practice1();
                                // print("기본글자1 clicked");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFCE4040),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "+ Add",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('problems/user_problems/list')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    print('에러있어요.');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print('waiting...');
                    // return Column(
                    //   children: [
                    //     const Center(
                    //       child: CircularProgressIndicator(),
                    //     ),
                    //   ],
                    // );
                  }

                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LibraryPractice(
                                    title: docs[index]['title'],
                                    content: docs[index]['content'],
                                  ),
                                ),
                              );
                              // const Practice1();
                              // print("기본글자1 clicked");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      docs[index]['title'],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      docs[index]['keyword'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          const Lines(),
                        ],
                      );
                    },
                  );

                  return Column(children: const [Text('데이터 없음')]);
                },
              ),

              // for (int index = 0; index < titles.length; index++)
              // Column(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => LibraryPractice(
              //               title: titles[index],
              //               content: keywords[index],
              //             ),
              //           ),
              //         );
              //         // const Practice1();
              //         // print("기본글자1 clicked");
              //       },
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 titles[index],
              //                 style: const TextStyle(fontSize: 20),
              //               ),
              //               Text(
              //                 keywords[index],
              //                 style: const TextStyle(
              //                   fontSize: 18,
              //                   color: Colors.grey,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const Icon(
              //             Icons.arrow_forward_ios,
              //             color: Colors.grey,
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Lines(),
              //   ],
              // ),
            ],
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
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          height: 0.5,
          width: 335,
          color: Colors.grey,
        ),
      ],
    );
  }
}
