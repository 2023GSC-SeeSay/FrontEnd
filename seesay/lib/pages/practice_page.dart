import 'package:flutter/material.dart';
import 'package:seesay/services/practice/basic_practice.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final int totalIndex = 8;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              for (int i = 0; i < totalIndex; i++)
                Column(
                  children: [
                    RealPractice(
                      index: i,
                    ),
                    const Lines(),
                  ],
                ),
              RealPractice(index: totalIndex),
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
  RealPractice({
    super.key,
    required this.index,
  });

  late int index;
  final List<String> contents = [
    "Begin",
    "기본 글자 1",
    "기본 글자 2",
    "기본 단어 1",
    "기본 단어 2",
    "기본 단어 3",
    "기본 문장 1",
    "기본 문장 2",
    "기본 문장 3",
  ];
  final List<String> contentsDetail = [
    "Welcome to SeeSay",
    "한글의 자음, 모음에 대해 알아봅시다",
    "한글의 기본글자를 발음해 봅시다",
    "동물을 발음해 봅시다",
    "음식을 발음해 봅시다",
    "장소를 발음해 봅시다",
    "자기소개 문장을 발음해 봅시다",
    "음식을 주문해 봅시다",
    "생각을 전달해 봅시다",
  ];
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BasicPractice(
              title: contents[index],
              content: contentsDetail[index],
            ),
          ),
        );
        // const Practice1();
        // print("기본글자1 clicked");
      },
      child: Row(
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
                contents[index],
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                contentsDetail[index],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
