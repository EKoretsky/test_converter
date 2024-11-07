import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Widget title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: title,
      trailing: const Icon(CupertinoIcons.chevron_forward),
      onTap: onTap,
    );
  }
}
