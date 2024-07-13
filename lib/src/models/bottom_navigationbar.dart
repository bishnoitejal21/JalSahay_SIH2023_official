import 'package:flutter/material.dart';
import 'package:jalsahay_sih2023/src/features/views/discussion/discussion_screen.dart';
import 'package:jalsahay_sih2023/src/features/views/get_help/gethelp_screen.dart';
import 'package:jalsahay_sih2023/src/features/views/home/home_screen.dart';
import 'package:jalsahay_sih2023/src/features/views/location/location_screen.dart';
import 'package:jalsahay_sih2023/src/features/views/sahayak_bot/bot_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    DiscussionScreen(),
    LocationScreen(),
    GetHelpScreen(),
    BotScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ph = MediaQuery.of(context).size.height;
    var pw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: pw * 0.4,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: pw * 0.01,
            ),
            Image.asset('assets/images/png/preamble.png'),
            SizedBox(
              width: pw * 0.02,
            ),
            Container(
              // height: ph * 0.02,
              width: pw * 0.2,
              child: Image.asset(
                'assets/images/png/digital_india.png',
                // width: pw * 0.05, // Explicit width
                // height: ph * 0.03,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        actions: [
          Image.asset('assets/images/png/english_hindi_translate.png'),
          SizedBox(
            width: pw * 0.02,
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: pw * 0.01,
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.5),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Discuss',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Locate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
