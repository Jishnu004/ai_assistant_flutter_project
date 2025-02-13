import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../helper/gobal.dart';

class AiChatbotFeature extends StatefulWidget {
  const AiChatbotFeature({super.key});

  @override
  State<AiChatbotFeature> createState() => _AiChatbotFeatureState();
}

class _AiChatbotFeatureState extends State<AiChatbotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI Assistant'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35, right: 5),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me Anything you want.....',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
            )),
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).bottonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          controller: _c.scrollC,
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.only(top: mq.height * 0.02, bottom: mq.height * 0.1),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
