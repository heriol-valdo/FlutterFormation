import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/providers/meme_provider.dart';
import 'package:formation/services/meme_service.dart';
import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // instanciation du service API
  MemeService _memeService = MemeService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inspect(_memeService.getMemes());

    return Scaffold(
      appBar: const AppbarWidget(),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _memeService.getMemes(),
          builder: (context, snapshot) {
            // la propriété snapshot contient les données renvoyées par la future
            if (snapshot.hasData) {
              // retyper les données reçues
              List data = snapshot.data as List;
              // inspect(data);
              return ListView(
                shrinkWrap: true,
                children: data
                    .map((meme) => ListTile(
                          title: Text(meme.name),
                          leading: Image.network(
                            meme.url,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // stocker l'objet dans le provider
                            context.read<MemeProvider>().meme = meme;

                            // naviguer vers le second écran
                            context.pushNamed('second');
                          },
                        ))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text('home page'),
        //     ElevatedButton(
        //       onPressed: () {
        //         // context : écran affiché
        //         context.pushNamed('second');
        //       },
        //       child: const Text('Second screen'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
