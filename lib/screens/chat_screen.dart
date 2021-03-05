import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/model/chat_model.dart';
import 'package:flutter_snapchat_clone_full/screens/profile_screen.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: appBarData(),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: White),
        child: SingleChildScrollView(child: chatData()),
      ),
    );
  }

  Widget appBarData() {
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
                  size: 24,
                  color: Red,
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
                size: 24,
                color: DarkGrey,
              ),
            ),
          ],
        ),
        Text(
          'Chat',
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
                size: 24,
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
                AntDesign.edit,
                color: DarkGrey,
                size: 24,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget chatData() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                height: 1,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Quick Add',
              style: TextStyle(color: Blue),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                height: 1,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(chat_model.length, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 40) * 0.68,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          chat_model[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: (size.width - 95) * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat_model[index]['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    chat_model[index]['nickname'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'NEW CONTACT',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Blue)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, bottom: 4, left: 12, top: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.add, size: 18, color: Blue),
                                    SizedBox(width: 5),
                                    Text(
                                      'Add',
                                      style: TextStyle(color: Blue),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              AntDesign.close,
                              size: 16,
                              color: DarkGrey.withOpacity(0.7),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider()
              ],
            );
          }),
        ),
      ],
    );
  }
}
