import 'package:flutter/material.dart';

class myTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List <Widget> tabs;
  const myTabBar({super.key,required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        tabs:tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
