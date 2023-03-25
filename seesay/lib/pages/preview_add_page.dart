import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seesay/components/add_textfield.dart';
import 'package:seesay/components/submit_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seesay/services/practice/upload_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localCounterFile async {
    final path = await _localPath;
    print('카운터 파일 경로: $path');
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localCounterFile;

      // 파일 읽기
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // 에러가 발생할 경우 0을 반환
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localCounterFile;

    // 파일 쓰기
    return file.writeAsString('$counter');
  }
}

class PreviewAddPage extends StatefulWidget {
  final CounterStorage storage = CounterStorage();

  String content;

  PreviewAddPage({
    super.key,
    required this.content,
  });

  @override
  State<PreviewAddPage> createState() => _PreviewAddPageState();
}

class _PreviewAddPageState extends State<PreviewAddPage> {
  int _counter = 0;
  Future<File> get _localContentFile async {
    final path = await widget.storage._localPath;
    print('컨텐츠 파일 경로: $path');
    return File('$path/library$_counter.txt');
  }

  Future<File> writeContent(String content) async {
    final file = await _localContentFile;

    // 파일 쓰기
    return file.writeAsString(content);
  }

  final titleController = TextEditingController();

  final keywordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    widget.storage.writeCounter(_counter);
    return writeContent(widget.content);

    // 파일에 String 타입으로 변수 값 쓰기
  }

  WriteCloud(title, keyword, content) {
    FirebaseFirestore.instance
        .collection('problems/user_problems/list')
        .doc('library$_counter')
        .set({
      'title': title,
      'keyword': keyword,
      'content': content,
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "SeeSay",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "서재에 미리보기로 표시될\n제목과 키워드를 입력하세요.",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const Text(
                  "(100자 이하)",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: titleController,
                  hintText: '제목을 입력하세요.',
                  labelText: '제목',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: keywordController,
                  hintText: '키워드를 입력하세요.',
                  labelText: '키워드',
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  buttonText: '저장',
                  onTap: () {
                    if (titleController.text.isEmpty) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('제목을 입력해주세요.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        ),
                      );
                    } else if (keywordController.text.isEmpty) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('키워드를 입력해주세요.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        ),
                      );
                    }
                    WriteCloud(
                      titleController.text,
                      keywordController.text,
                      widget.content,
                    );
                    Future<File> futurefile = _incrementCounter();
                    File file;
                    futurefile.then((value) {
                      file = value;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadPage(
                            file: file,
                            isAudio: false,
                          ),
                        ),
                      );
                    }).catchError((error) {
                      print('error: $error');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
