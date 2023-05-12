import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:formation/controllers/password_widget_controller.dart';

class PasswordWidget extends StatefulWidget {
  // propriétés possèdant un comportement d'état lorsque la fonction setState est utilisée
  bool obscureText = true;
  int typeLength = 0;

  PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  // appel de l'état
                  // widget permet d'accéder à la classe du widget à partir de la classe de l'état
                  obscureText: widget.obscureText,
                  decoration: const InputDecoration(
                    label: Text('Saisir un mot de passe'),
                  ),
                  onChanged: (String value) {
                    //inspect(value);
                    // modifier l'état
                    setState(() {
                      widget.typeLength = value.length;
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  // setState permet de modifier la valeur d'un état
                  setState(() {
                    //widget.obscureText = !widget.obscureText;
                    widget.obscureText =
                        PasswordWidgetController.getObscure(widget.obscureText);
                  });
                },
                icon: PasswordWidgetController.getIcon(widget.obscureText),
              ),
            ],
          ),
          // SizedBox : bloc possédant des dimensions
          const SizedBox(
            height: 15,
          ),
          Text(
            '${widget.typeLength} caractères saisis',
          ),
          const SizedBox(
            height: 15,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 150,
            height: 5,
            decoration: BoxDecoration(
              color: PasswordWidgetController.getColor(widget.typeLength),
            ),
          ),
        ],
      ),
    );
  }
}
