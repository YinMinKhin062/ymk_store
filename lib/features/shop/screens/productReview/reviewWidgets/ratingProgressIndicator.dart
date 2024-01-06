import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator(
      {super.key, required this.starNo, required this.ratePercentage});

  final String starNo;
  final double ratePercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            starNo,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
          ),
        ),
        Expanded(
          flex: 11,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.withOpacity(.2),
                minHeight: 6,
                value: ratePercentage,
                valueColor: const AlwaysStoppedAnimation(Colors.amber),
              ),
            ),
          ),
        )
      ],
    );
  }
}
