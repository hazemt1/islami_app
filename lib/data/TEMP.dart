import 'package:flutter/material.dart';
import 'package:islami_app/data/AppConfig.dart';
import 'package:provider/provider.dart';

class PlaceholderWidget extends StatefulWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget> {
  // late AppConfig provider;

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<AppConfig>(context);
    return Container(
      //return to original

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     InkWell(
      //       onTap: () {
      //         if(provider.isDarkModeEnabled())
      //           provider.toggleTheme();
      //       },
      //       child: Container(
      //           padding: EdgeInsets.all(40),
      //           child: Text('light')),
      //     ),
      //     InkWell(
      //         onTap: () {
      //           if(!provider.isDarkModeEnabled())
      //             provider.toggleTheme();
      //         },
      //         child: Container(
      //             padding: EdgeInsets.all(40),
      //             child: Text('dark'))
      //     )
      //   ],
      // ),
    );
  }

}