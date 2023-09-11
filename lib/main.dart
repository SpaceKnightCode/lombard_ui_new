import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui/il_text_field.dart';
import 'package:lombard_ui_new/il_checkbox.dart';
import 'package:lombard_ui_new/il_details_card.dart';
import 'package:lombard_ui_new/il_expansion_tile.dart';
import 'package:lombard_ui_new/il_options_textbox.dart';
import 'package:lombard_ui_new/il_radio_button.dart';
import 'package:lombard_ui_new/il_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LombardUITestPage());
}

class LombardUITestPage extends StatefulWidget {
  const LombardUITestPage({super.key});

  @override
  State<LombardUITestPage> createState() => _LombardUITestPageState();
}

class _LombardUITestPageState extends State<LombardUITestPage> {
  String? year;

  @override
  Widget build(BuildContext context) {
    ILSizeConfig().init(context);

    return MaterialApp(
        home: Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ILDetailsCard(
          title: "Add on cover",
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ILOptionsTextbox(
                    hasInfo: true,
                    text: "Car Insurance",
                    leading: Image.network(
                      "https://w7.pngwing.com/pngs/639/449/png-transparent-computer-icons-website-icon-text-globe-symmetry-thumbnail.png",
                    ),
                    infoUrl: "https://www.google.com",
                  ),
                  Spacer(),
                  ILCheckBox(
                    text: "",
                    onChanged: () {},
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ILOptionsTextbox(
                    hasInfo: true,
                    text: "Car Insurance",
                    leading: Image.network(
                      "https://w7.pngwing.com/pngs/639/449/png-transparent-computer-icons-website-icon-text-globe-symmetry-thumbnail.png",
                    ),
                    infoUrl: "https://www.google.com",
                  ),
                  Spacer(),
                  ILCheckBox(
                    text: "",
                    onChanged: () {},
                  ),
                ],
              ),
            ],
          ),
        ),

        // ILOptionsTextbox(
        //   icon: Icons.access_alarms_rounded,
        //   text: "text",
        //   hasInfo: true,
        // ),

        // ILRadioButton(
        //   title: "1 year",
        //   isDisabled: true,
        //   value: "1",
        //   subtitle: "\$1001",
        //   isRecommended: false,
        //   groupValue: year,
        //   onChanged: (value) {
        //     setState(() {
        //       year = value;
        //     });
        //   },
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // ILRadioButton(
        //   title: "3 year",
        //   subtitle: "\$3001",
        //   value: "3",
        //   isRecommended: false,
        //   groupValue: year,
        //   onChanged: (value) {
        //     setState(() {
        //       year = value;
        //     });
        //   },
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // ILRadioButton(
        //   title: "2 year",
        //   value: "2",
        //   subtitle: "\$2001",
        //   groupValue: year,
        //   isRecommended: true,
        //   onChanged: (value) {
        //     setState(() {
        //       year = value;
        //     });
        //   },
        // ),
      ),
    )

        // ILCheckBox(
        //   text: "hello",
        // ),

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
        );
  }
}
