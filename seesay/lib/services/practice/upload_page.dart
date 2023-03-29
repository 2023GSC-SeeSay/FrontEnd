import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  final File file; // 어플에서 업로드 하는 파일의 경로
  bool isAudio;

  UploadPage({
    this.isAudio = true,
    required this.file,
    Key? key,
  }) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late File _file;
  late final String _fileName; //firebase에 저장될 파일명 = widget._file에서 파일명을 추출
  String? _url; // firebase Storage에 업로드 후 업로드된 파일의 다운로드 URL
  bool _uploading = false;
  @override
  void initState() {
    _fileName = widget.file.path.split('/').last;
    // _fileName = Platform.isIOS || Platform.isAndroid
    //     ? widget.file.path.split('/').last
    //     : widget.file.path.split('\\').last;
    _uploadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xFFCE4040),
          ),
        ),
        body: widget.isAudio
            ? Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Score",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFCE4040),
                      ),
                    ),

                    const SizedBox(height: 30),

                    if (_uploading)
                      Column(
                        children: const [
                          Text("Uploading"),
                          SizedBox(height: 30),
                          CircularProgressIndicator(
                            color: Color(0xFFCE4040),
                          ),
                        ],
                      ),

                    if (!_uploading)
                      Column(
                        children: [
                          const Text(
                            "100",
                            style:
                                TextStyle(fontSize: 100, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Perfect!",
                            style: TextStyle(
                              color: Color(0xFFCE4040),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "Go to main page and\npronounce other words too",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 200,
                            child: Image.asset(
                                "assets/images/MovingSeeSayBig.gif"),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(19.0),
                            child: GotoHomeButton(),
                          ),
                        ],
                      ),

                    // const Text("Score of your pronounciation: "),
                    // const Text("000점"),
                    // IconButton(
                    //     iconSize: 80,
                    //     onPressed: () {
                    //       Navigator.popUntil(context, ModalRoute.withName('/'));
                    //     },
                    //     icon: const Icon(Icons.home)),

                    // const SizedBox(height: 20),
                    // Text('File Name: $_fileName'),
                    // const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: _uploading ? null : _uploadFile,
                    //   child: const Text('Upload File'),
                    // ),
                    // const SizedBox(height: 20),
                    // _url != null ? Text('File URL: $_url') : Container(),
                  ],
                ),
              )
            : Column(
                children: [
                  const Text(
                    "Library",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFCE4040),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Added Successfully!",
                    style: TextStyle(
                      color: Color(0xFFCE4040),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "go to library to see your word",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    child: Image.asset("assets/images/MovingSeeSayBig.gif"),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(19.0),
                    child: GotoHomeButton(),
                  ),
                ],
              ));
  }

  void _uploadFile() async {
    setState(() {
      _uploading = true;
    });
    try {
      final metadata = widget.isAudio
          ? SettableMetadata(contentType: "audio/m4a")
          : SettableMetadata(contentType: "text/txt");
      // final metadata = SettableMetadata(contentType: "text/txt");

      final storageRef = FirebaseStorage.instance.ref();
      final uploadTask = widget.isAudio
          ? storageRef.child("audio/$_fileName").putFile(widget.file, metadata)
          : storageRef.child("text/$_fileName").putFile(widget.file, metadata);
      // final uploadTask =
      //     storageRef.child("text/$_fileName").putFile(widget.file, metadata);
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        final progress =
            100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
        print("Upload is $progress% complete.");
      });

      // final snapshot = await uploadTask.whenComplete(() {});
      final snapshot = await uploadTask;
      final url = await snapshot.ref.getDownloadURL();
      print("Upload done!");
      setState(() {
        _url = url;
        _uploading = false;
      });
    } catch (e) {
      print(e.toString());

      setState(() {
        _uploading = false;
      });
    }

    // setState(() {
    //   _uploading = true;
    // });
    // widget.file;
    // _fileName;

    // try {`₩
    //   FirebaseStorage storage = FirebaseStorage.instance;
    //   Reference ref = storage.ref().child("audio/$_fileName"); //업로드될 파일의 경로
    //   // Reference ref = storage.ref("child").child(_fileName); //업로드될 파일의 경로

    //   UploadTask uploadTask = ref.putFile(widget.file); //업로드할 파일

    //   uploadTask.snapshotEvents.listen((event) {
    //     double progress =
    //         event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
    //     print('Upload progress: $progress');

    //     setState(() {
    //       //업로드 진행률 바 업데이트
    //     });
    //   });
    // } catch (e) {
    //   // print(widget.file);
    //   // if (await widget.file.exists()) print("파일 있음");
    //   // if (!widget.file.existsSync()) print("File does not exits");
    //   print(e.toString());
    // }
  }
}

class GotoHomeButton extends StatelessWidget {
  const GotoHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[800],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Got it",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
