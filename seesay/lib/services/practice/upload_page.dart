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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_uploading) const Text("Uploading"),
            const SizedBox(height: 30),
            if (_uploading)
              const CircularProgressIndicator(
                color: Color(0xFFCE4040),
              ),
            const Text("Score of your pronounciation: "),
            const Text("000점"),
            IconButton(
                iconSize: 80,
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home)),
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
      ),
    );
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
