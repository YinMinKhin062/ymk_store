import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final IconData icon;
  const SearchBar({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Sizes.sm + 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const Icon(
            Iconsax.search_normal,
            color: Colors.grey,
          ),
          const SizedBox(
            width: Sizes.inputFieldSpaces/2,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
