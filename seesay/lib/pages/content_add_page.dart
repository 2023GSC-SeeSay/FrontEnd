import 'package:flutter/material.dart';
import 'package:seesay/components/add_textfield.dart';
import 'package:seesay/components/submit_button.dart';
import 'package:seesay/pages/preview_add_page.dart';

class ContentAddPage extends StatelessWidget {
  ContentAddPage({super.key});

  final textController = TextEditingController();

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
                  "Enter the word\nyou want to pronounce",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "(50 characters or less)",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: textController,
                  hintText: 'Please enter a word.',
                  labelText: 'word',
                  lengthCheck: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                    buttonText: 'Next',
                    onTap: () {
                      if (textController.text.isEmpty) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('Please enter your details.'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviewAddPage(
                            content: textController.text,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
