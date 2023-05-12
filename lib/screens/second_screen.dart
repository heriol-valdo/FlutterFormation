import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/models/meme.dart';
import 'package:formation/providers/meme_provider.dart';
import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //récupération des données stockées dans le provider
    Meme? meme = context.watch<MemeProvider>().meme;

    inspect(meme);

    return Scaffold(
      appBar: const AppbarWidget(),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.network(meme!.url!)),
            Text(meme!.name!),
            ElevatedButton(
              onPressed: () {
                // pop: supprimer l'écran affiché
                context.pop();
              },
              child: const Text('home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
