import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seesay/services/practice/basic_practice.dart';

class WordPage extends StatelessWidget {
  QueryDocumentSnapshot<Map<String, dynamic>> doc;
  WordPage({
    super.key,
    required this.doc,
  });

  @override
  Widget build(BuildContext context) {
    final words = doc['words'].toString().split(',');
    print(words);
    final count = doc['words'].toString().split(',').length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFCE4040),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Text(
              doc['title'],
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFFCE4040),
              ),
            ),
            Text(
              doc['intro'],
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BasicPractice(
                                title: doc['title'],
                                content: doc['intro'],
                              ),
                            ),
                          );
                          // const Practice1();
                          // print("기본글자1 clicked");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                words[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemCount: words.length,
                  ),
                )

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => BasicPractice(
                //             title: doc['title'],
                //             content: doc['intro'],
                //           ),
                //         ),
                //       );
                //       // const Practice1();
                //       // print("기본글자1 clicked");
                //     },
                //     child: Row(
                //       children: [
                //         Text(
                //           words[index],
                //           style: const TextStyle(fontSize: 20),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const Lines(),
              ],
            ),
          ],
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
            vertical: 15,
          ),
          height: 0.5,
          width: 350,
          color: Colors.grey,
        ),
      ],
    );
  }
}
