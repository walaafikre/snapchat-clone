import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';
import 'package:video_player/video_player.dart';

class StoryDetailScreen extends StatefulWidget {
  final String videoUrl;

  const StoryDetailScreen({Key key, this.videoUrl}) : super(key: key);
  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);

    _controller.addListener(() {
      setState(() {});
    });
    // _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Black,
      appBar: AppBar(
        backgroundColor: Black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              AntDesign.like2,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Entypo.dots_three_vertical,
              size: 20,
            ),
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: videoPlay(),
      ),
    );
  }

  Widget videoPlay() {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: VideoPlayer(_controller)),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Black.withOpacity(0.6),
            Black.withOpacity(0),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    MaterialIcons.keyboard_arrow_up,
                    color: White,
                    size: 28,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: White, borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Text(
                        "View More Episodes",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.2),
                    border: Border.all(color: White.withOpacity(0.2))),
                child: Center(
                  child: Icon(
                    FontAwesome.location_arrow,
                    size: 20,
                    color: White,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
