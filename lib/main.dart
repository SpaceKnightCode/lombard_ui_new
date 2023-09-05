import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui/il_text_field.dart';
import 'package:lombard_ui_new/il_checkbox.dart';
import 'package:lombard_ui_new/il_expansion_tile.dart';
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
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),

          child: ILCheckBox(
            text: "hello",
          ),

          // ILExpansionTile(
          //   title: "Ownswe",
          //   child: Row(
          //     children: [
          //       Container(
          //         color: Colors.red,
          //         child: const Text('text'),
          //       )
          //     ],
          //   ),
          // ),

          //ILButton

          // child: ILTextButton(
          //   text: "kuuvfuvuvulvulv",
          //   icon: Icons.add,
          //   iconPosition: IconPosition.left,
          //   onPressed: () {
          //     print("object");
          //   },
          //   backgroundColor: Colors.orange,
          // ),
        ),
      ),
    );
  }
}
