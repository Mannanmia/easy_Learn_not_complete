import 'package:easy_learn/helper/all_strings.dart';
import 'package:easy_learn/screen/bookmark_screen.dart';
import 'package:easy_learn/screen/forum_screen.dart';
import 'package:easy_learn/screen/home_screen.dart';
import 'package:easy_learn/screen/log_in_screen.dart';
import 'package:flutter/material.dart';

import '../helper/all_colors.dart';

AllString allString = AllString();
AllColor allColor = AllColor();

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(context),
          DrawerMenuItems(context),
        ],
      ),
    );
  }

  Widget DrawerHeader(BuildContext context) => Container(
        color: allColor.backColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .01,
          vertical: MediaQuery.of(context).size.height * .01,
        ),
    child: DashBoardScreen(),
      );

  Widget DrawerMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.forum_rounded),
              title: Text("Forum"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForumScreen()));
              },
            ),

            ListTile(
              leading: Icon(Icons.bookmark_rounded),
              title: Text("Change bookmark"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings_rounded),
              title: Text("Log In"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
              },
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(Icons.question_mark_rounded),
              title: Text("About us"),
              onTap: () {},
            ),
          ],
        ),
      );
}
