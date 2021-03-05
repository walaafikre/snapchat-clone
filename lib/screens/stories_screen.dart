import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/model/stories_model.dart';
import 'package:flutter_snapchat_clone_full/screens/profile_screen.dart';
import 'package:flutter_snapchat_clone_full/screens/story_detail_screen.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

class StoriesScreen extends StatefulWidget {
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: White,
        title: storiesAppBar(),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: White),
        child: SingleChildScrollView(
          child: videoData(),
        ),
      ),
    );
  }

  Widget videoData() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Text(
            "For You",
            style: TextStyle(
                fontSize: 16, color: Black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(stories_model.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.scale,
                          alignment: Alignment.bottomCenter,
                          child: StoryDetailScreen(
                            videoUrl: stories_model[index]['videoUrl'],
                          )));
                },
                child: Container(
                  width: (size.width - 30) / 2,
                  child: Stack(
                    children: [
                      Container(
                        width: (size.width - 30) / 2,
                        height: size.height * 0.31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image:
                                    NetworkImage((stories_model[index]['img'])),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: (size.width - 15) / 2,
                        height: size.height * 0.31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Black.withOpacity(0.25),
                                  Black.withOpacity(0),
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                stories_model[index]['name'],
                                style: TextStyle(
                                    color: White,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 10, bottom: 10),
                              child: Text(
                                stories_model[index]['date'],
                                style: TextStyle(
                                    color: White.withOpacity(0.7),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget storiesAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Black.withOpacity(0.1)),
                child: Icon(
                  Entypo.user,
                  color: Primary,
                  size: 28,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Black.withOpacity(0.1)),
              child: Icon(
                Feather.search,
                color: DarkGrey,
                size: 23,
              ),
            )
          ],
        ),
        Text(
          "Stories",
          style: TextStyle(
              fontSize: 18, color: Black, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Black.withOpacity(0.1)),
              child: Icon(
                Feather.user_plus,
                color: DarkGrey,
                size: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Black.withOpacity(0.1)),
              child: Icon(
                Entypo.dots_three_horizontal,
                color: DarkGrey,
                size: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
