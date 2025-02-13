import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screens/home_screen.dart';
import 'package:ai_assistant/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/gobal.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'Hi there! Im here to help ask me anything, and lets explore together!',
          lottie: 'ai_askMe'),
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Turning your creative ideas into real-world solutions with the power of AI!',
          lottie: 'ai_imagine'),
    ];

    return Scaffold(
        body: PageView.builder(
      controller: c,
      itemCount: list.length,
      itemBuilder: (ctx, ind) {
        final isLast = ind == list.length - 1;

        return Column(
          children: [
            Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .6),
            Text(
              list[ind].title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: mq.height * .015,
            ),
            SizedBox(
              width: mq.width * .7,
              child: Text(
                list[ind].subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.5,
                    letterSpacing: 0.5,
                    color: Theme.of(context).lightTextColor),
              ),
            ),
            const Spacer(),
            Wrap(
              spacing: 10,
              children: List.generate(
                  list.length,
                  (i) => Container(
                        width: i == ind ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                            color: i == ind ? Colors.blue : Colors.grey,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(5))),
                      )),
            ),
            const Spacer(),
            CustomBtn(
              onTap: () {
                if (isLast) {
                  Get.off(() => const HomeScreen());
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (_) => const HomeScreen()));
                } else {
                  c.nextPage(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.ease);
                }
              },
              text: isLast ? 'Finish' : 'Next',
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        );
      },
    ));
  }
}
