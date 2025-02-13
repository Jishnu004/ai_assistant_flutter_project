import 'package:ai_assistant/feature/ai_chatbot_feature.dart';
import 'package:ai_assistant/feature/ai_image_creator_feature.dart';
import 'package:ai_assistant/feature/ai_speechToText.dart';
import 'package:ai_assistant/feature/ai_translator_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImagine, aiTranslator, aiSpeechToText }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
        HomeType.aiChatBot => 'AI Chatbot',
        HomeType.aiImagine => 'AI Image Creator',
        HomeType.aiTranslator => 'Language Translator',
        HomeType.aiSpeechToText => 'Speech To Text',
      };

  //lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'ai_chatbot.json',
        HomeType.aiImagine => 'ai_imagine_card.json',
        HomeType.aiTranslator => 'ai_transalator.json',
        HomeType.aiSpeechToText => 'ai_SpeechToText.json',
      };

  //Align Left
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImagine => false,
        HomeType.aiTranslator => true,
        HomeType.aiSpeechToText => false,
      };

  //Padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImagine => EdgeInsets.zero,
        HomeType.aiTranslator => EdgeInsets.all(20),
        HomeType.aiSpeechToText => EdgeInsets.zero,
      };
  //Calling the page
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => const AiChatbotFeature()),
        HomeType.aiImagine => () => Get.to(() => const AiImageCreatorFeature()),
        HomeType.aiTranslator => () =>
            Get.to(() => const AiTranslatorFeature()),
        HomeType.aiSpeechToText => () => Get.to(() => const AiSpeechToText()),
      };
}
