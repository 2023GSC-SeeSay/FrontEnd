import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:record/record.dart';
import 'package:seesay/services/practice/upload_page.dart';

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;

  const AudioRecorder({super.key, required this.onStop});

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  Amplitude? _amplitude;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    _amplitudeSub = _audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) => setState(() => _amplitude = amp));
    super.initState();
  }

  void reset() {
    setState(() {
      _recordDuration = 0;
      _recordState = RecordState.stop;
    });
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }
        await _audioRecorder.start();
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);
    }
  }

  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
  }

  final String gifUrl1 = "gif/0_60_tongue.gif";
  final String gifUrl2 = "gif/0_60_mouth.gif";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Repeat Simultaneously",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/0_58_tongue.gif',
              width: 370,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/0_58_mouth.gif',
              width: 370,
              height: 315,
              fit: BoxFit.contain,
            ),
            // FutureBuilder(
            //     future: loadGifFromFirebase1(),
            //     builder:
            //         (BuildContext context, AsyncSnapshot<File> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done &&
            //           snapshot.hasData) {
            //         return SizedBox(
            //           width: 370,
            //           height: 220,
            //           child: Image.file(
            //             snapshot.data!,
            //             fit: BoxFit.contain,
            //           ),
            //         );
            //       } else {
            //         return const CircularProgressIndicator(
            //             color: Color(0xFFce4040));
            //       }
            //     }),
            // FutureBuilder(
            //     future: loadGifFromFirebase2(),
            //     builder:
            //         (BuildContext context, AsyncSnapshot<File> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done &&
            //           snapshot.hasData) {
            //         return SizedBox(
            //           width: 370,
            //           height: 300,
            //           child: Image.file(
            //             snapshot.data!,
            //             fit: BoxFit.contain,
            //           ),
            //         );
            //       } else {
            //         return const CircularProgressIndicator(
            //             color: Color(0xFFce4040));
            //       }
            //     }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 40),
                _buildRecordStopControl(),
                const SizedBox(width: 40),
                _buildPauseResumeControl(),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            // _buildText(),
            // if (_amplitude != null) ...[
            // const SizedBox(height: 40),
            // Text('Current: ${_amplitude?.current ?? 0.0}'),
            // Text('Max: ${_amplitude?.max ?? 0.0}'),
            // ],
          ],
        ),
      ),
    );
  }

  Future<File> loadGifFromFirebase1() async {
    final Reference ref = FirebaseStorage.instance.ref().child(gifUrl1);
    final File file =
        await DefaultCacheManager().getSingleFile(await ref.getDownloadURL());
    return file;
  }

  Future<File> loadGifFromFirebase2() async {
    final Reference ref = FirebaseStorage.instance.ref().child(gifUrl2);
    final File file =
        await DefaultCacheManager().getSingleFile(await ref.getDownloadURL());
    return file;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = const Icon(Icons.stop, color: Color(0xFFCE4040), size: 100);
      color = const Color(0xFFCE4040).withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.mic, color: Color(0xFFCE4040), size: 100);
      color = const Color(0xFFCE4040).withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SizedBox(width: 150, height: 150, child: icon),
          onTap: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (_recordState == RecordState.record) {
      icon = const Icon(Icons.pause, color: Color(0xFFCE4040), size: 100);
      color = const Color(0xFFCE4040).withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Color(0xFFCE4040), size: 100);
      color = const Color(0xFFCE4040).withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SizedBox(width: 150, height: 150, child: icon),
          onTap: () {
            (_recordState == RecordState.pause) ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }

    return const Text(
      "Press the Button to Start Recording",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30),
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(
        color: Color(0xFFCe4040),
        fontSize: 30,
      ),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  bool showPlayer = false;
  late String audioPath;
  late File audioFile;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  void restart() {
    setState(() {
      showPlayer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(
      //     color: Color(0xFFCE4040),
      //   ),
      // ),
      body: Center(
        child: showPlayer
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Recording Done!",
                      style: TextStyle(fontSize: 30, color: Color(0xFFCE4040)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFCE4040).withOpacity(0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              // border: Border.all(
                              //   width: 1,
                              // ),
                            ),
                            margin: const EdgeInsets.all(2),
                            child:
                                // const Text("다시 녹음"),
                                IconButton(
                              iconSize: 80,
                              onPressed: () => restart(),
                              icon: const Icon(Icons.restart_alt_rounded),
                              color: const Color(0xFFCE4040),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFCE4040).withOpacity(0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              // border: Border.all(
                              //   width: 1,
                              // ),
                            ),
                            // margin: const EdgeInsets.all(2),
                            child:
                                // const Text("녹음 제출"),
                                IconButton(
                              iconSize: 80,
                              alignment: Alignment.center,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UploadPage(
                                            file: audioFile,
                                          ))),
                              icon: const Icon(Icons.check),
                              color: const Color(0xFFCE4040),
                            ),
                          ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : AudioRecorder(
                onStop: (path) {
                  path = path.substring(7);
                  if (kDebugMode) print('Recorded file path: $path');
                  setState(() {
                    audioPath = path;
                    audioFile = File(audioPath);
                    showPlayer = true;
                  });
                },
              ),
      ),
    );
  }
}
