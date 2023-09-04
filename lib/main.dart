import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui_new/il_text_button.dart';

void main(List<String> args) {
  runApp(LombardUITestPage());
}

class LombardUITestPage extends StatelessWidget {
  const LombardUITestPage({super.key});

  @override
  Widget build(BuildContext context) {
    ILSizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 100, left: 60),
          child: ILTextButton(
            text: "kuuvfuvuvulvulv",
            icon: Icons.add,
            iconPosition: IconPosition.left,
            onPressed: () {
              print("object");
            },
            backgroundColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}
