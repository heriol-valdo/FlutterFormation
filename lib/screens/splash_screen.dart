import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/models/meme.dart';
import 'package:formation/providers/meme_provider.dart';
import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () => context.replaceNamed('auth'));
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/meme.png')),
          ],
        ),
      ),
    );
  }
}
