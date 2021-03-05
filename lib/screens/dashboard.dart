import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/screens/camera_screen.dart';
import 'package:flutter_snapchat_clone_full/screens/chat_screen.dart';
import 'package:flutter_snapchat_clone_full/screens/discover_screen.dart';
import 'package:flutter_snapchat_clone_full/screens/map_screen.dart';
import 'package:flutter_snapchat_clone_full/screens/stories_screen.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';

class Dashboard extends StatefulWidget {
  static String tag = '/Dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 2;
  List<Widget> pages = [
    MapScreen(),
    ChatScreen(),
    CameraScreen(),
    StoriesScreen(),
    DiscoverScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: getBottomFooter(),
    );
  }

  Widget getBottomFooter() {
    List iconItems = [
      Feather.map_pin,
      MaterialIcons.chat_bubble_outline,
      Feather.camera,
      Feather.users,
      Feather.menu,
    ];
    List textItems = ['Map', 'Chat', 'Camera', 'Stories', 'Discover'];
    List colorItems = [Green, Blue, Primary, Purple, Primary];
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top:
                  BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : White.withOpacity(0.5)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: pageIndex == index
                              ? White
                              : White.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
