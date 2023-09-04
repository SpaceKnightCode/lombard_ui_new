import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui/il_text_field.dart';
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

          child: ILExpansionTile(
            title: "Ownswe",
            child: Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  height: 100,
                  width: 100,
                  color: Colors.red,
                )
              ],
            ),
          ),

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
