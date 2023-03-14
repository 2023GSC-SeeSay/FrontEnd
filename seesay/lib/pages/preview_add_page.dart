import 'package:flutter/material.dart';
import 'package:seesay/components/add_textfield.dart';
import 'package:seesay/components/submit_button.dart';
import 'package:seesay/services/practice/library_practice.dart';

class PreviewAddPage extends StatelessWidget {
  PreviewAddPage({super.key});

  final titleController = TextEditingController();
  final keywordController = TextEditingController();

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LibraryPractice(
                          title: titleController.text,
                          content: keywordController.text,
                        ),
                      ),
                    );
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
