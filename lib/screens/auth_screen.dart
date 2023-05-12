import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/models/user.dart';
import 'package:formation/services/auth_service.dart';

import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  //état du formulaire
  final _formKey = GlobalKey<FormState>();

  // stocker la saisie

  //stocker la saisie
  Map<String, String> _formType = {
    'username': 'kminchelle',
    'password': '0lelplR'
  };

  //API d'authentification
  AuthService _authService = AuthService();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // inspect(_memeService.getMemes());

    return Scaffold(
      appBar: const AppbarWidget(),
      body: Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.center,
          child: Form(
            key: widget._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: 'kminchelle',
                  decoration: const InputDecoration(
                    label: Text('Login'),
                  ),
                  onChanged: (String value) {
                    widget._formType['username'] = value;
                  },
                  validator: (String? value) =>
                      value!.isEmpty ? 'Login error' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: '0lelplR',
                  decoration: const InputDecoration(
                    label: Text('Pasword'),
                  ),
                  onChanged: (String value) {
                    widget._formType['password'] = value;
                  },
                  validator: (String? value) =>
                      value!.isEmpty ? 'password error' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //si le formulaire est valide
                    if (widget._formKey.currentState!.validate()) {
                      //sauvegarder l'état du formulaire
                      /*  widget._formKey.currentState!.save();

                      //appel de l'API d'authentification
                      widget._authService.getAuth(widget._formType);
                      inspect(widget._formType);
                      */
                      widget._authService
                          .getAuth(widget._formType)
                          .then((User user) => context.replaceNamed('home'))
                          .onError((error, stackTrace) => {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Credentials error"),
                                  duration: const Duration(seconds: 5),
                                  backgroundColor: Colors.red,
                                ))
                              });
                    }
                  },
                  child: const Text('Connect'),
                )
              ],
            ),
          )),
    );
  }
}
