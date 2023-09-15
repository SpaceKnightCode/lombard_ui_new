import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui_new/il_switch_button.dart';
import 'package:lombard_ui_new/il_text_image.dart';
import 'package:lombard_ui_new/il_textfield.dart';
import 'package:lombard_ui_new/il_checkbox.dart';
import 'package:lombard_ui_new/il_details_card.dart';
import 'package:lombard_ui_new/il_expansion_tile.dart';
import 'package:lombard_ui_new/il_options_textbox.dart';
import 'package:lombard_ui_new/il_radio_button.dart';
import 'package:lombard_ui_new/il_splitcard.dart';
import 'package:lombard_ui_new/il_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LombardUITestPage());
}

class LombardUITestPage extends StatefulWidget {
  const LombardUITestPage({super.key});

  @override
  State<LombardUITestPage> createState() => _LombardUITestPageState();
}

class _LombardUITestPageState extends State<LombardUITestPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ILSizeConfig().init(context);

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 100, left: 20, right: 20),

          child: ILSwitchButton(
            onChanged: () {},
          ),

          // child: ILTextImage(
          //   image: Image.network(
          //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbPR9o1fOPg6j7cQ0uX4AsxAhKFv_zJ3wkkA&usqp=CAU"),
          //   text: "hello world",
          //   padding: 10,
          //   isCurved: true,
          //   spacing: 10,
          //   textAlign: TextAlign.start,
          //   textColor: Colors.red,
          //   textSize: 20,
          //   height: 200,
          //   width: 400,
          //   borderColor: Colors.black,
          //   fit: BoxFit.fitWidth,
          //   backgroundColor: Colors.grey,
          // ),

          // child: ILTextField(
          //   controller: controller,
          //   hintText: "Enter Username here",
          //   labelText: "Name",
          //   isMandatory: true,
          //   isPassword: false,
          //   onChanged: (value) {
          //     print(value);
          //   },
          //   isCurved: false,
          //   isEnabled: true,
          //   maxLength: 20,
          // ),
          // child: ILSplitCard(
          //   width: ILSizeConfig.blockSizeH * 100,
          //   header: Container(
          //     color: Colors.red,
          //     width: 300,
          //     height: 50,
          //   ),
          //   body: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.yellow,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     width: 100,
          //     height: 100,
          //   ),
          //   footer: Container(
          //     color: Colors.blue,
          //     width: 300,
          //     height: 50,
          //   ),
          // ),

          // child: ILDetailsCard(
          //   title: "Add on cover",
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           ILOptionsTextbox(
          //             hasInfo: true,
          //             text: "Car Insurance",
          //             leading: Image.network(
          //               "https://w7.pngwing.com/pngs/639/449/png-transparent-computer-icons-website-icon-text-globe-symmetry-thumbnail.png",
          //             ),
          //             infoUrl: "https://www.google.com",
          //           ),
          //           const Spacer(),
          //           ILCheckBox(
          //             text: "",
          //             onChanged: () {},
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           ILOptionsTextbox(
          //             hasInfo: true,
          //             text: "Car Insurance",
          //             leading: Image.network(
          //               "https://w7.pngwing.com/pngs/639/449/png-transparent-computer-icons-website-icon-text-globe-symmetry-thumbnail.png",
          //             ),
          //             infoUrl: "https://www.google.com",
          //           ),
          //           const Spacer(),
          //           ILCheckBox(
          //             text: "",
          //             onChanged: () {},
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

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
        ),
      ),
    );
  }
}
