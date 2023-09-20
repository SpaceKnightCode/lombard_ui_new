import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui_new/il_dropdown.dart';
import 'package:lombard_ui_new/il_heading_text_box.dart';
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
  String? year = "1";

  @override
  Widget build(BuildContext context) {
    ILSizeConfig().init(context);

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ILHeadingTextBox(
                  title: "Hyundai Santro GL",
                  urlText: "View Details",
                  url: "https://www.google.com",
                  subtitle: "M23847AG",
                ),
                const SizedBox(
                  height: 10,
                ),
                ILDropdown(
                  items: const [
                    "option  1",
                    "jANechb",
                    "option q34r",
                    "ESFEaawef",
                    "option 123",
                    "option asd",
                    "EFceWesfwDEF",
                    "53Y45SSZG"
                  ],
                  label: "Customer type",
                  onChanged: (String value) {
                    print(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ILTextField(
                  controller: controller,
                  hintText: "Enter Username here",
                  labelText: "Name",
                  isMandatory: true,
                  isPassword: false,
                  onChanged: (value) {
                    print(value);
                  },
                  isCurved: true,
                  isEnabled: true,
                  maxLength: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ILExpansionTile(
                  title: "Expanded Tile",
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                ILSwitchButton(
                                  isEmptySwitch: false,
                                  onChanged: () {
                                    print("switch buttom clicked");
                                  },
                                  // activeColor: ILColors.kDarkRedColor,
                                  // inactiveColor: ILColors.kGreenColor,
                                  // hasShadow: true,
                                  // isDisabled: false,
                                  // isCurved: false,
                                  // textColor: Colors.blue,
                                  // offText: "off",
                                  // onText: "Yes",
                                  // isOn: true,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ILTextButton(
                                  text: "Add policy",
                                  icon: Icons.add,
                                  iconPosition: IconPosition.left,
                                  onPressed: () {
                                    print("added policy");
                                  },
                                  backgroundColor: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ILOptionsTextbox(
                        leading: Icon(
                          Icons.access_alarms_rounded,
                        ),
                        text: "what is the time",
                        hasInfo: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ILDetailsCard(
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
                          const Spacer(),
                          ILCheckBox(
                            text: "",
                            onChanged: (value) {
                              if (value) {
                                print("car insurance selected");
                              } else {
                                print("car insurance unselected");
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ILOptionsTextbox(
                            hasInfo: true,
                            text: "health Insurance",
                            leading: Image.network(
                              "https://w7.pngwing.com/pngs/639/449/png-transparent-computer-icons-website-icon-text-globe-symmetry-thumbnail.png",
                            ),
                            infoUrl: "https://www.google.com",
                          ),
                          const Spacer(),
                          ILCheckBox(
                              text: "",
                              onChanged: (value) {
                                if (value) {
                                  print("health insurance selected");
                                } else {
                                  print("health insurance unselected");
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ILRadioButton(
                        title: "3 year",
                        subtitle: "\$3001",
                        value: "3",
                        isRecommended: false,
                        groupValue: year,
                        onChanged: (value) {
                          setState(() {
                            year = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ILRadioButton(
                        title: "2 year",
                        value: "2",
                        subtitle: "\$2001",
                        groupValue: year,
                        isRecommended: true,
                        onChanged: (value) {
                          setState(() {
                            year = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ILRadioButton(
                        title: "1 year",
                        value: "1",
                        subtitle: "\$1001s",
                        groupValue: year,
                        onChanged: (value) {
                          setState(() {
                            year = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ILTextImage(
                  image: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbPR9o1fOPg6j7cQ0uX4AsxAhKFv_zJ3wkkA&usqp=CAU"),
                  text: "hello world",
                  padding: 10,
                  isCurved: true,
                  spacing: 10,
                  // textAlign: TextAlign.start,
                  // textColor: Colors.red,
                  textSize: 20,
                  height: 200,
                  width: 400,
                  // borderColor: Colors.black,
                  fit: BoxFit.fitWidth,
                  // backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
