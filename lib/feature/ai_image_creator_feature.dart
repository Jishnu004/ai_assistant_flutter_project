import 'package:ai_assistant/controller/image_controller.dart';
import 'package:ai_assistant/widgets/custom_btn.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/gobal.dart';

class AiImageCreatorFeature extends StatefulWidget {
  const AiImageCreatorFeature({super.key});

  @override
  State<AiImageCreatorFeature> createState() => _AiImageCreatorFeatureState();
}

class _AiImageCreatorFeatureState extends State<AiImageCreatorFeature> {
  final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Image Creator'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: mq.height * 0.02,
            bottom: mq.height * 0.1,
            left: mq.width * .04,
            right: mq.width * .04),
        children: [
          TextFormField(
            controller: _c.textC,
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            decoration: InputDecoration(
                hintText:
                    'Imagine it, type it, and let AI\nturn your words into amazing artwork!🖌️',
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: mq.height * .5,
              alignment: Alignment.center,
              child: Obx(() => _aiImage())),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: CustomBtn(onTap: _c.createAiImage, text: 'Imagine')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _aiImage() => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: switch (_c.status.value) {
          Status.none => Lottie.asset('assets/lottie/ai_imagine.json'),
          Status.loading => CustomLoading(),
          Status.complete => CachedNetworkImage(
              imageUrl: _c.url,
              placeholder: (context, url) => CustomLoading(),
              errorWidget: (context, url, error) => SizedBox(),
            )
        },
      );
}
