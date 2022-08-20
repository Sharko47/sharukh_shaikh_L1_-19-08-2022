import 'package:flutter/material.dart';
import 'package:sharukh_shaikh_l1/constants/constants.dart';

import 'my_text.dart';

class PrimaryButton extends StatelessWidget {
  final String btnText;
  final double? width;
  final double height;
  final Function()? onPressed;
  final bool disablePadding;
  final Color color;
  final bool hasBorder;
  final Color textColor;
  final double textSize;

  const PrimaryButton(
      {Key? key,
      required this.btnText,
      this.width,
      this.height = 40.0,
      this.onPressed,
      this.disablePadding = false,
      this.color = kDarkBlackColor,
      this.hasBorder = false,
      this.textColor = Colors.black,
      this.textSize = 16.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: disablePadding
          ? EdgeInsets.zero
          : const EdgeInsets.only(right: 48.0, left: 48.0),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            onPrimary: Colors.white38,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              border: hasBorder ? Border.all() : const Border(),
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            child: Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: MyText(
                  text: btnText,
                  textAlignment: TextAlign.center,
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }
}
