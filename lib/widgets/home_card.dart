import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import '../helper/gobal.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(bottom: mq.height * 0.02),
            elevation: 0,
            color: Colors.blue.withOpacity(.2),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: homeType.onTap,
                child: homeType.leftAlign
                    ? Row(
                        children: [
                          Container(
                            width: mq.width * .35,
                            padding: homeType.padding,
                            child: Lottie.asset(
                                'assets/lottie/${homeType.lottie}'),
                          ),
                          Spacer(),
                          Text(
                            homeType.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).lightTextColor,
                                fontSize: 16,
                                letterSpacing: .5),
                          ),
                          Spacer(
                            flex: 3,
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            homeType.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).lightTextColor,
                                fontSize: 16,
                                letterSpacing: .5),
                          ),
                          Spacer(),
                          Container(
                            width: mq.width * .35,
                            padding: homeType.padding,
                            child: Lottie.asset(
                                'assets/lottie/${homeType.lottie}'),
                          ),
                        ],
                      )))
        .animate()
        .fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
