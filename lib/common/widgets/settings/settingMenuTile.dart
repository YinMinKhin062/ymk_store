import 'package:flutter/material.dart';


class SettingMenuTile extends StatelessWidget {
  final String menuTitle;
  final String menuSubtitle;
  final IconData icon;
  final Widget ?trailing;
  final VoidCallback? onTap;
  const SettingMenuTile({super.key,required this.menuTitle,
  required this.menuSubtitle,required this.icon,this.trailing,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:   SizedBox(
        height: 50,
        child:
         Icon(icon,color: Colors.deepPurple,size: 28,),
        ),
      title: Text(menuTitle,style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(menuSubtitle,style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black.withOpacity(.5)),),
      trailing: trailing,
      onTap: onTap,
    );
  }
}