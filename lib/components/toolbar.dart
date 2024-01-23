import 'package:flutter/material.dart';
import 'package:flutter_app_1/styles/app_text.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppText.header1,),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
