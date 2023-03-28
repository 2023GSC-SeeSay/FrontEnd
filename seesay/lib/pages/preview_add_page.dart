import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seesay/components/add_textfield.dart';
import 'package:seesay/components/submit_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seesay/services/practice/upload_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreviewAddPage extends StatefulWidget {
  String content;

  PreviewAddPage({
    super.key,
    required this.content,
  });

  @override
  State<PreviewAddPage> createState() => _PreviewAddPageState();
}

class _PreviewAddPageState extends State<PreviewAddPage> {
  final int _counter = 0;
  Future<File> get _localContentFile async {
    final path = await _localPath;
    print('컨텐츠 파일 경로: $path');
    return File('$path/${titleController.text}.txt');
  }

  Future<File> writeContent(String content) async {
    final file = await _localContentFile;

    // 파일 쓰기
    return file.writeAsString(content);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  final titleController = TextEditingController();

  final keywordController = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  //   widget.storage.readCounter().then((int value) {
  //     setState(() {
  //       _counter = value;
  //     });
  //   });
  // }

  Future<File> _incrementCounter() {
    // setState(() {
    //   _counter++;
    // });
    // widget.storage.writeCounter(_counter);
    return writeContent(widget.content);

    // 파일에 String 타입으로 변수 값 쓰기
  }

  WriteCloud(title, keyword, content) {
    FirebaseFirestore.instance
        .collection('problems/user_problems/list')
        .doc(title)
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
                  "Enter the title and keywords that will be displayed as previews in your library.",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const Text(
                  "(100 characters or less)",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: titleController,
                  hintText: 'Please enter a title.',
                  labelText: 'title',
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: keywordController,
                  hintText: 'Please enter a keyword.',
                  labelText: 'keyword',
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  buttonText: 'save',
                  onTap: () {
                    if (titleController.text.isEmpty) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('Please enter a title.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('ok'),
                            ),
                          ],
                        ),
                      );
                    } else if (keywordController.text.isEmpty) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('Please enter a keyword.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('ok'),
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
