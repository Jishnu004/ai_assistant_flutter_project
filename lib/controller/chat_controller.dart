import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/helper/my_dialogs.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();
  final list = <Message>[
    Message(msg: 'Hello, How may I help you?', msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      //user message
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollDown();

      final res = await APIs.getAnswer(textC.text);

      //bot reply
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();
      textC.text = '';
    } else {
      MyDialogs.info('Ask something!');
    }
  }

// for auto-scrolling
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
