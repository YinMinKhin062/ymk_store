import 'package:flutter/material.dart';

import '../../../../../utils/theme/custom_themes/sizes.dart';

class UploadTile extends StatelessWidget {
  const UploadTile(
      {super.key,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.text,
      this.onPressed});
  final VoidCallback? onPressed;
  final IconData prefixIcon, suffixIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            prefixIcon,
            color: Colors.deepPurple,
            size: Sizes.spaceBetweenSections - 4,
          ),
         const SizedBox(
            width: Sizes.spaceBetween,
          ),
          Expanded(
              child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
              size: Sizes.spaceBetweenSections - 4,
              color: Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
