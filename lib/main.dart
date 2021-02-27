import 'package:flutter/material.dart';
import 'package:instagram_stories/ui/insta_story_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstagramStoryPage(),
    );
  }
}
