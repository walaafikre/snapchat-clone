import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/model/discover_model.dart';
import 'package:flutter_snapchat_clone_full/model/stories_model.dart';
import 'package:flutter_snapchat_clone_full/screens/story_detail_screen.dart';
import 'file:///F:/flutterapps/flutter_snapchat_clone_full/lib/utils/widgets.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: White,
        title: discoverAppBar(),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: White.withOpacity(0.9)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                quickAdd(),
                SizedBox(
                  height: 25,
                ),
                popularSnap(),
                SizedBox(
                  height: 25,
                ),
                trendingLens(),
                SizedBox(
                  height: 20,
                ),
                // videoData(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget quickAdd() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Add',
          style: TextStyle(
              fontSize: 16, color: Black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: White,
              boxShadow: [
                BoxShadow(
                  color: DarkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(quick_add_model.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44) * 0.65,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                quick_add_model[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          quick_add_model[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          quick_add_model[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Black.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 44) * 0.35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.withOpacity(0.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          bottom: 8,
                                          top: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Feather.user_plus,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: DarkGrey.withOpacity(0.7),
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: Black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget popularSnap() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Snap Stars",
          style: TextStyle(
              fontSize: 16, color: Black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: White,
              boxShadow: [
                BoxShadow(
                  color: DarkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(popular_star_model.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44) * 0.55,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 57,
                                    height: 57,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: White),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    popular_star_model[index]
                                                        ['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          popular_star_model[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          popular_star_model[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Black.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 44) * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.withOpacity(0.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          bottom: 8,
                                          top: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            AntDesign.like2,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Subscribe",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: Black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget trendingLens() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trending Lenses",
              style: TextStyle(
                  fontSize: 16, color: Black, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Explore Lenses",
                  style: TextStyle(
                      fontSize: 13,
                      color: Black.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Black.withOpacity(0.5),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: White,
              boxShadow: [
                BoxShadow(
                  color: DarkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(trending_lens_model.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Black),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3, color: White),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    trending_lens_model[index]
                                                        ['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trending_lens_model[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          trending_lens_model[index]
                                              ['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: Black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget videoData() {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "For You",
              style: TextStyle(
                  fontSize: 16, color: Black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
                    width: (size.width - 30) / 2.1,
                    child: Stack(
                      children: [
                        Container(
                          width: (size.width - 30) / 2.1,
                          height: size.height * 0.31,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      (stories_model[index]['img'])),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: (size.width - 15) / 2.1,
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
      ),
    );
  }
}
