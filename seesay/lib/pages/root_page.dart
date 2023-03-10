import 'package:flutter/material.dart';
import 'package:seesay/pages/add_page.dart';
import 'package:seesay/pages/home_page.dart';
import 'package:seesay/pages/library_page.dart';
import 'package:seesay/pages/practice_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seesay/pages/setting_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootState();
}

class _RootState extends State<RootPage> {
  List pages = [
    const HomePage(),
    const PracticePage(),
    const LibraryPage(),
    const AddPage(),
  ];

  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => (const SettingPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: onSetting,
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            onPressed: signUserOut,
            icon: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: onTap,
        currentIndex: currentIndex,
        iconSize: 30,
        selectedItemColor: const Color(0xFFCE4040),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
            // icon: Icon(Icons.RootPage),
          ),
          BottomNavigationBarItem(
            label: '연습',
            icon: Icon(Icons.note_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: '서재',
            icon: Icon(Icons.book_outlined),
          ),
          BottomNavigationBarItem(
            label: '추가',
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
    );
  }
}
