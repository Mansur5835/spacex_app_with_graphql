import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../animations/slide_and_opasity_anim.dart';
import '../app_navigator.dart';
import '../app_text.dart';

class WarringView extends StatelessWidget {
  const WarringView({
    super.key,
    required this.warningText,
    required this.yesTab,
  });
  final String warningText;
  final Function() yesTab;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        child: SlideAndOpasityAnim(
            opasityDuration: 200,
            slideDuration: 500,
            curve: Curves.fastOutSlowIn,
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.blackGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        warningText,
                        color: AppColors.white,
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  AppNavigator.back();
                                },
                                child: AppText(
                                  "No",
                                  color: Colors.red,
                                  size: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  AppNavigator.back();
                                  yesTab();
                                },
                                child: AppText(
                                  "Yes",
                                  color: Colors.green,
                                  size: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
