import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/utils/theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    this.leftIcon,
    this.rightIcon,
    required this.onTap,
    required this.mainAxisAlignment,
  }) : super(key: key);
  final String text;
  final double height;
  final double width;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final void Function()? onTap;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.appColor.brown.withOpacity(0.5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.appColor.white),
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            leftIcon ?? const SizedBox(),
            Text(
              text,
              style: context.textTheme.headline2?.copyWith(fontSize: 20, color: AppColors.appColor.brown),
            ),
            rightIcon ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
