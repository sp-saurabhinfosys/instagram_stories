import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_stories/ui/customs/story_card.dart';

class InstagramStoryPage extends StatefulWidget {
  @override
  _InstaStoryPageState createState() => _InstaStoryPageState();
}

class _InstaStoryPageState extends State<InstagramStoryPage> with SingleTickerProviderStateMixin{
  List<String> storyImage = [
    "https://images.pexels.com/photos/2033997/pexels-photo-2033997.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    "https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/4666748/pexels-photo-4666748.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/1921336/pexels-photo-1921336.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/3744162/pexels-photo-3744162.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://images.pexels.com/photos/1366913/pexels-photo-1366913.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://wallpapercave.com/wp/wp2553949.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6mnJ_jsjpleW-U_jC1dpmpfFfJ-dMrUPa4w&usqp=CAU",
    "https://fsa.zobj.net/crop.php?r=_SJpZTEt8pqbCV8hlMxMjwkfG_w8QJRnKG7golTq3jVbEMbeIIFivPyN0fi9GAKFjg1IbrlesmRhV8CUXYOTW53nJD0R3JlTtkYVqPiJcAI3bgYf1thcsR9CX_se-8DI_xrCYxtcRUT8Ao3wxnw1aZYdamEh6ERg22YeeDE1Mf2ndEhqGB0aPAjyFzQ",
    "https://wallpaperaccess.com/full/95154.jpg",
  ];
  PageController _pageController = PageController();
  int index=0;
  double sec=0.0;
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        duration: const Duration(seconds: 4,milliseconds: 350), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();

    Timer.periodic(Duration(seconds: 4,), (Timer timer) {
      if (index < storyImage.length) {
        index++;
      } else {
        index = 0;
      }

      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          PageView.builder(

            onPageChanged: (x){

              index = x;
              setState(() {

              });
            },
              controller: _pageController,
              itemCount: storyImage.length,
              itemBuilder: (c, i) {
                return StoryCard(
                  img: storyImage[i],
                  onLeftClick: () {

                    print("Left");
                    if(i>0) {
                      _pageController.animateToPage(
                        i - 1,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    }
                    setState(() {

                    });
                  },
                  onMiddleRemove: () {
                    print("Middle Remove");
                  },
                  onMiddleTap: (x) {
                    print("Middle Tap");
                  },
                  onRightClick: () {
                    print("Right");
                    if(storyImage.length!=i) {
                      _pageController.animateToPage(
                        i + 1,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                      setState(() {

                      });
                    }
                  },
                );
              }),
          SafeArea(child: Row(
            children: List.generate(storyImage.length, (index){

              if(this.index ==index)
                {
                  return Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(height: 2,color: Colors.transparent,
                    child:LinearProgressIndicator( value:  animation.value,backgroundColor: Colors.white38,valueColor: new AlwaysStoppedAnimation<Color>(Colors.white60),), ),
                  ));
                }
              else if(this.index < index)
              {
                return Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(height: 2,color: Colors.white38,),
                ));
              }
              else
              {
                return Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(height: 2,color: Colors.white60,),
                ));
              }
            }),
          )),
        ],
      ),
    );
  }
}
