import 'package:flutter/material.dart';
import 'package:seesay/services/add/file_add.dart';
import 'package:seesay/services/add/image_add.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

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
                "Add",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFCE4040),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Add to my Library",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              addWidget(
                context,
                "Typing Text",
                Icons.insert_comment_rounded,
                0,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // addWidget(
              //   context,
              //   "Taking Photo",
              //   Icons.camera_alt_rounded,
              //   1,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              // addWidget(
              //   context,
              //   "Uploading File",
              //   Icons.folder_copy,
              //   2,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector addWidget(
    BuildContext context,
    String input,
    IconData inputIcon,
    int index,
  ) {
    List addPages = [
      // TextAdd(),
      const ImageAdd(),
      const fileAdd(),
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => addPages[index],
          ),
        );
      },
      child: Container(
        width: 600,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFCE4040).withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                inputIcon,
                size: 50,
                color: const Color(0xFFCE4040).withOpacity(0.3),
              ),
              Text(
                input,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
