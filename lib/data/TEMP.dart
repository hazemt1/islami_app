// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:islami_app/data/AppConfigProvider.dart';
// import 'package:provider/provider.dart';
//
// class PlaceholderWidget extends StatefulWidget {
//   final Color color;
//   late AppConfigProvider provider;
//   PlaceholderWidget(this.color);
//
//   @override
//   _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
// }
//
// class _PlaceholderWidgetState extends State<PlaceholderWidget> {
//   // late AppConfig provider;
//
//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<AppConfigProvider>(context);
//     // provider = Provider.of<AppConfig>(context);
//     return Container(
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           InkWell(
//             onTap: () {
//               changeLanguage(context);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 28),
//               child: Text(
//                 AppLocalizations.of(context)!.language,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//       //return to original
//
//       // child: Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   children: [
//       //     InkWell(
//       //       onTap: () {
//       //         if(provider.isDarkModeEnabled())
//       //           provider.toggleTheme();
//       //       },
//       //       child: Container(
//       //           padding: EdgeInsets.all(40),
//       //           child: Text('light')),
//       //     ),
//       //     InkWell(
//       //         onTap: () {
//       //           if(!provider.isDarkModeEnabled())
//       //             provider.toggleTheme();
//       //         },
//       //         child: Container(
//       //             padding: EdgeInsets.all(40),
//       //             child: Text('dark'))
//       //     )
//       //   ],
//       // ),
//     );
//   }
//
//   void changeLanguage(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     provider.changeLanguage("en");
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     child: Text(
//                       "English",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     provider.changeLanguage("ar");
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     child: Text(
//                       "العربية",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }