import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AiSpeechToText extends StatefulWidget {
  const AiSpeechToText({super.key});

  @override
  State<AiSpeechToText> createState() => _AiSpeechToTextState();
}

class _AiSpeechToTextState extends State<AiSpeechToText> {
  final Map<String, HighlightedWord> _highlights = {
    'hello': HighlightedWord(
        onTap: () => print('hello'),
        textStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 32)),
    'what': HighlightedWord(
        onTap: () => print('what'),
        textStyle: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 32)),
    'why': HighlightedWord(
        onTap: () => print('why'),
        textStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 32)),
  };
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _txt = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        actions: [
          IconButton(
              onPressed: _copyToClipboard,
              icon: Icon(
                Icons.copy,
                color: Colors.blue,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.red,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: _isListening ? Colors.red : Colors.blue,
          onPressed: _listening,
          child: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 150),
          child: TextHighlight(
            text: _txt,
            words: _highlights,
            textStyle: TextStyle(
                fontSize: 32, color: Colors.blue, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  void _listening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _txt = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _txt));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Copied to clipboard')));
  }
}
