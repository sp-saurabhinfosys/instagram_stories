import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final VoidCallback onLeftClick;
  final VoidCallback onRightClick;
  final GestureLongPressStartCallback onMiddleTap;
  final VoidCallback onMiddleRemove;
  final String img;

  StoryCard(
      {this.onLeftClick,
      this.onRightClick,
      this.onMiddleTap,
      this.onMiddleRemove,
      this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        )),
        child: Row(
          children: [
            GestureDetector(
                onTap: onLeftClick,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .33,
                )),
            Expanded(
                child: GestureDetector(
                    onLongPressStart: onMiddleTap,
                    onLongPressUp: onMiddleRemove,
                    child: Container(color: Colors.transparent,))),
            GestureDetector(

                onTap: onRightClick,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .33,
                )),
          ],
        ));
  }
}
