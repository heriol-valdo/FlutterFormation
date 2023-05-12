import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My application'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
