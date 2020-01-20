// import 'package:flutter/material.dart';

// import 'Pages/ListPage.dart';
// import 'Pages/RootPage.dart';
// import 'Pages/TextPage.dart';
// import 'destination.dart';

// class DestinationView extends StatefulWidget {
//   const DestinationView({ Key key, this.destination }) : super(key: key);

//   final Destination destination;

//   @override
//   _DestinationViewState createState() => _DestinationViewState();
// }

// class _DestinationViewState extends State<DestinationView> {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       onGenerateRoute: (RouteSettings settings) {
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (BuildContext context) {
//             switch(settings.name) {
//               case '/':
//                 return RootPage(destination: widget.destination);
//               case '/list':
//                 return ListPage(destination: widget.destination);
//               case '/text':
//                 return TextPage(destination: widget.destination);
//             }
//           },
//         );
//       },
//     );
//   }
// }