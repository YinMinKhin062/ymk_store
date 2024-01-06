import 'package:flutter/material.dart';

class myTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabBarIndicatorSize? indicatorSize;
  final Color? color;
  const myTabBar(
      {super.key,
      required this.tabs,
      this.color = Colors.white,
      this.indicatorSize});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
