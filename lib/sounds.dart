import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

class SoundTester extends StatefulWidget {
  static const String Id = 'sound';
  @override
  _SoundTesterState createState() => _SoundTesterState();
}

class _SoundTesterState extends State<SoundTester> {
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _myRecorder = FlutterSoundRecorder();

  bool _mPlayerIsInited;
  void noMethod(){

  }

  Future<void> record() async {
    await _myRecorder.startRecorder(
      toFile:"Codec.mp3",
      codec: Codec.aacADTS,
    );
  }


  Future<void> stopRecorder() async {
    await _myRecorder.stopRecorder();
  }

  @override
  void initState() {
    super.initState();
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    _myPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

  }



  @override
  void dispose() {
    // Be careful : you must `close` the audio session when you have finished with it.
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),

            Text(
              'Sound Tester',style: TextStyle(fontSize: 30, color: Color(0xFFe91e63), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(
              'Record Sounds',style: TextStyle(fontSize: 18, color: Color(0xFF424242), fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              onPressed: () async{
                record();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFe91e63),
                      Color(0xFFec407a),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Record Start', style: TextStyle(fontSize: 20)),
              ),
            ),
            RaisedButton(
              onPressed: () async{
                stopRecorder();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFe91e63),
                      Color(0xFFec407a),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Record Start', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
