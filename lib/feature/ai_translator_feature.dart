import 'package:ai_assistant/widgets/custom_btn.dart';
import 'package:ai_assistant/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/image_controller.dart';
import '../controller/translate_controller.dart';
import '../helper/gobal.dart';
import '../widgets/custom_loading.dart';

class AiTranslatorFeature extends StatefulWidget {
  const AiTranslatorFeature({super.key});

  @override
  State<AiTranslatorFeature> createState() => _AiTranslatorFeatureState();
}

class _AiTranslatorFeatureState extends State<AiTranslatorFeature> {
  final _c = TranslateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Language Translator'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * 0.02,
          bottom: mq.height * 0.1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //From Language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.from,
                )),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child:
                      Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                ),
              ),
              IconButton(
                  onPressed: _c.swapLanguages,
                  icon: Obx(
                    () => Icon(
                      CupertinoIcons.repeat,
                      color: _c.to.isNotEmpty && _c.from.isNotEmpty
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  )),
              //To Language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.to,
                )),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                ),
              ),
            ],
          ),
          //Input TextField
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .035),
            child: TextFormField(
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Translate anything you want️...',
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
            ),
          ),
          //Output TextField
          Obx(() => _translateResult()),
          SizedBox(height: mq.height * .04),

          CustomBtn(onTap: _c.translate, text: 'Translate')
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
        Status.none => SizedBox(),
        Status.loading => const Align(child: CustomLoading()),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            child: TextFormField(
              controller: _c.resultC,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
            ),
          ),
      };
}
