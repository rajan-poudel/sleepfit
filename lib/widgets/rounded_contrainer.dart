import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/color.manager.dart';
import '../common/value.manager.dart';
import 'large.text.widget.dart';

class RoundedContrainer extends StatelessWidget {
  RoundedContrainer({
    Key? key,
    required this.text,
    required this.iconData,
    this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback? press;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.subTitle.withOpacity(0.4)
                // width: 5,
                ),
            borderRadius: BorderRadius.circular(99)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                iconData,
                size: AppSize.s20,
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              AppLargeText(
                text: text,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
