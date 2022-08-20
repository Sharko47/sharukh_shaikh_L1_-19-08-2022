import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharukh_shaikh_l1/constants/app_assets.dart';
import 'package:sharukh_shaikh_l1/widgets/my_text.dart';
import 'package:sharukh_shaikh_l1/widgets/primary_button.dart';

class SideMenu extends StatelessWidget {
  final Function(int) onMenuItemPress;
  SideMenu({Key? key, required this.onMenuItemPress, this.pressedIndex = 0})
      : super(key: key);
  final menuItems = ['Activity', 'BMI', 'Heart', 'Sleep', 'Goals', 'Workout'];
  final menuItemsIcons = [
    activityIcon,
    bmiIcon,
    heartIcon,
    sleepIcon,
    goalsIcon,
    workoutIcon
  ];
  final int pressedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              "assets/images/nav_img.png",
              width: 72.0,
              height: 72.0,
            ),
          ),
        ),
        ...List.generate(
          menuItems.length,
          (index) => DrawerItem(
            isActive: index == 0,
            isSelected: index == pressedIndex,
            iconPath: menuItemsIcons[index],
            title: menuItems[index],
            press: () => onMenuItemPress(index),
          ),
        ),
        Image.asset(workoutNavImg),
        MyText(
          text: "Change dashboard settings from here",
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          textAlignment: TextAlign.center,
        ),
        const SizedBox(
          height: 16.0,
        ),
        PrimaryButton(
          btnText: "Settings",
          textColor: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isActive;
  final VoidCallback press;
  final bool isSelected;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.isActive,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        hoverColor: Colors.grey.shade200,
        focusColor: Colors.grey.shade400,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        selected: isActive,
        onTap: press,
        minLeadingWidth: 32,
        leading: SvgPicture.asset(
          iconPath,
          width: 20,
          height: 20.0,
          color: Colors.grey,
        ),
        title: MyText(
          text: title,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
