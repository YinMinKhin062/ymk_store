import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/txtContents.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key});

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Expanded(
            child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: TxtContents.agree,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TxtContents.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurple,
                    )),
            TextSpan(
                text: TxtContents.and,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TxtContents.terms,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    color: Colors.deepPurple)),
          ])),
        ))
      ],
    );
  }
}
