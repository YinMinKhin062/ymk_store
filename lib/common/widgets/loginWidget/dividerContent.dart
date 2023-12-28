import 'package:flutter/material.dart';


class DividerContent extends StatelessWidget {
  final String dividerTxt;
  const DividerContent({super.key,required this.dividerTxt});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
       const Flexible(
          child: Divider(
            color: Colors.grey,
            thickness: .5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerTxt,
          style: const TextStyle(color: Colors.grey),
        ),
        const Flexible(
          child: Divider(
            color: Colors.grey,
            thickness: .5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
