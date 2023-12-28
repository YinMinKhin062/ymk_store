import 'package:flutter/material.dart';


class HeaderSection extends StatelessWidget {
  final String title, btnTitle;
  final bool showActionBtn;
  final VoidCallback? onPressed;
  final Color? txtColor, btnTxtColor;
  const HeaderSection(
      {super.key,
      required this.title,
      required this.btnTitle,
      this.showActionBtn = false,
      this.onPressed,
      this.txtColor,
      this.btnTxtColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.headlineSmall!.apply(color: txtColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionBtn)
          TextButton(
              onPressed: onPressed,
              child: Text(
                btnTitle,
                style: TextStyle(color: btnTxtColor),
              )),
      ],
    );
  }
}
