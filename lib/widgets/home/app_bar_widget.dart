import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Row(
        children: const <Widget>[
          Icon(
            FontAwesomeIcons.github,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text('GitHub')
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
