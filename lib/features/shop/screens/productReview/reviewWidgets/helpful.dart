import 'package:flutter/material.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class Helpful extends StatefulWidget {
  Helpful(
      {super.key,
      this.count = 1,
      required this.firstIcon,
      required this.changedIcon,
      required this.text,
      required this.isClicked,
      this.onTap});

  final int count;
  final IconData firstIcon, changedIcon;
  final String text;
  bool isClicked;
  final void Function(bool)? onTap;

  @override
  State<Helpful> createState() => _HelpfulState();
}

class _HelpfulState extends State<Helpful> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget.isClicked = !widget.isClicked;
      }),
      child: Row(
        children: [
          widget.isClicked
              ? Icon(
                  widget.changedIcon,
                  size: Sizes.defaultSpace - 2,
                  color: Colors.deepPurple,
                )
              : Icon(
                  // Iconsax.like_14,
                  widget.firstIcon,
                  size: Sizes.defaultSpace - 2,
                  color: Colors.grey,
                ),
          const SizedBox(
            width: Sizes.sm,
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: widget.isClicked ? Colors.deepPurple : null),
          ),
          const SizedBox(
            width: Sizes.sm,
          ),
          widget.isClicked
              ? Text(
                  widget.count.toString(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.deepPurple),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
