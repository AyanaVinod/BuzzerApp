import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/group_button.dart';
import 'package:group_button/group_button.dart';

import '../Colors/colors.dart';

class GroupButtonLimit extends StatefulWidget {
  const GroupButtonLimit({Key? key}) : super(key: key);

  @override
  State<GroupButtonLimit> createState() => _GroupButtonLimit();
}

class _GroupButtonLimit extends State<GroupButtonLimit> {
  String ? selectedIndex ;
  final i = GroupButtonController();

 //  void _isSelected(int i) {
 //  setState(() {
 // final id=i.
 //  controller.selectedIndexes.contains(i);
 // });
 //  }

  
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(children: [
              SizedBox(
                child: Column(children: [
                  GroupButton(
                    controller: i,
                    // onSelected:(){
                    //   widget.onChanged?.call(index);
                    //   setState(() {
                    //     value = index;
                    //   });
                    // },
                    isRadio: true,
                    buttons: const [
                      "1 sec",
                      "45 sec",
                      "1 min",
                      "2 min",
                      "Custom"
                    ],
                    options: GroupButtonOptions(
                      selectedShadow: [],
                      selectedTextStyle: const TextStyle(
                        fontFamily: 'Gilroy',
                        color: textYellow,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      selectedColor: commonBackground,
                      selectedBorderColor: timeButtonSelectedBorder,
                      unselectedBorderColor: gamePopColor,
                      unselectedColor: commonBackground,
                      spacing: 7.5,
                      runSpacing: 7.5,
                      groupingType: GroupingType.column,
                      direction: Axis.vertical,
                      mainGroupAlignment: MainGroupAlignment.spaceAround,
                      crossGroupAlignment: CrossGroupAlignment.start,
                      groupRunAlignment: GroupRunAlignment.spaceEvenly,
                      unselectedTextStyle: const TextStyle(
                        fontFamily: 'Gilroy',
                        color: textYellow,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      buttonWidth: 100,
                    ),
                  ),
                ]),
              ),
            ])));
  }
}
