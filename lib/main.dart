import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharukh_shaikh_l1/constants/app_assets.dart';
import 'package:sharukh_shaikh_l1/constants/constants.dart';
import 'package:sharukh_shaikh_l1/responsive.dart';
import 'package:sharukh_shaikh_l1/screens/models/my_goals.dart';
import 'package:sharukh_shaikh_l1/screens/models/physical_reading.dart';
import 'package:sharukh_shaikh_l1/screens/side_menu.dart';
import 'package:sharukh_shaikh_l1/widgets/my_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColorShades,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var drawerMenuItemPressedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Responsive.isDesktop(context)
            ? const SizedBox()
            : Drawer(
                child: SideMenu(
                pressedIndex: drawerMenuItemPressedIndex,
                onMenuItemPress: (pressedIndex) {
                  setState(() {
                    drawerMenuItemPressedIndex = pressedIndex;
                  });
                },
              )),
        drawerEnableOpenDragGesture:
            Responsive.isDesktop(context) ? false : true,
        body: Row(
          children: [
            if (Responsive.isDesktop(context))
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8.0,
                          offset: Offset(1, 1),
                          color: Colors.black12)
                    ]),
                width: 225,
                margin: const EdgeInsets.only(right: 4.0),
                child: SideMenu(
                  pressedIndex: drawerMenuItemPressedIndex,
                  onMenuItemPress: (pressedIndex) {
                    setState(() {
                      drawerMenuItemPressedIndex = pressedIndex;
                    });
                  },
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        scaffoldKey: _scaffoldKey,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Wrap(
                        runSpacing: 72.0,
                        spacing: 16.0,
                        clipBehavior: Clip.none,
                        children: List.generate(
                            physicalReadingList.length,
                            (index) => PhysicalReadingWrapItem(
                                  physicalReading: physicalReadingList[index],
                                )),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(230, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "My Goals",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 12.0,
                                          color: Colors.black12,
                                          offset: Offset(1, -1)),
                                      BoxShadow(
                                          blurRadius: 12.0,
                                          color: Colors.black12,
                                          offset: Offset(-1, 1))
                                    ],
                                  ),
                                  child: const Icon(Icons.menu_rounded),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                children: List.generate(
                                  myGoalList.length,
                                  (index) => MyGoalListItem(
                                    myGoals: myGoalList[index],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class MyGoalListItem extends StatelessWidget {
  final MyGoals myGoals;
  const MyGoalListItem({Key? key, required this.myGoals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        clipBehavior: Clip.none,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (!Responsive.isMobile(context))
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Column(
                    children: [
                      MyText(
                        text: "${myGoals.goalPercentage}%",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        text: myGoals.weeklyRecord,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      )
                    ],
                  ),
                ),
              ),
            Padding(
              padding: Responsive.isMobile(context)
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(right: 128.0),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 24.0, bottom: 24.0, left: 35.0, right: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                      )
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: myGoals.name,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: LinearProgressIndicator(
                              value: 0.2,
                              minHeight: 10.0,
                              color: Colors.green,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100.0,
                    ),
                    Column(
                      children: [
                        MyText(
                          text: myGoals.record,
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Chip(
                          label: MyText(
                            text: myGoals.daysLeft,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE91E63),
                          ),
                          backgroundColor: const Color(0xFFF8BBD0),
                          elevation: 2.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                width: 48,
                height: 48.0,
                bottom: 24,
                left: -22,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 16,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                      color: kDarkBlackColor,
                    ),
                    child: myGoals.icon)),
          ],
        ));
  }
}

class PhysicalReadingWrapItem extends StatelessWidget {
  final PhysicalReading physicalReading;
  const PhysicalReadingWrapItem({Key? key, required this.physicalReading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200.0, minWidth: 180.0),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -32,
              right: 0,
              left: 0,
              child: Image.asset(
                physicalReading.imgPath,
                width: 60,
                height: 60,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                MyText(
                  text: physicalReading.label,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: MyText(
                    text: physicalReading.record,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          InkWell(
              borderRadius: BorderRadius.circular(24.0),
              onTap: () {
                if (_scaffoldKey.currentState?.isDrawerOpen == true) {
                  _scaffoldKey.currentState?.openEndDrawer();
                } else {
                  _scaffoldKey.currentState?.openDrawer();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.menu_rounded),
              )),
        if (Responsive.isTablet(context) || Responsive.isDesktop(context))
          Expanded(
              child: MyText(
            text: "Dashboard",
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          )),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (str) {},
                    decoration: const InputDecoration(
                        isDense: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Search",
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 18.0)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  child: const Icon(
                    Icons.search_rounded,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        SizedBox(
          height: 60.0,
          child: Material(
            elevation: 18.0,
            shadowColor: Colors.black38,
            borderRadius: BorderRadius.circular(12.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    userAvatar,
                    width: 32.0,
                    height: 32.0,
                  ),
                  if (Responsive.isTablet(context) ||
                      Responsive.isDesktop(context))
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: MyText(
                        text: "Ananta Jolil",
                      ),
                    )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
