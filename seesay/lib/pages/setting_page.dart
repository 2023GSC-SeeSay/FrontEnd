import 'package:flutter/material.dart';
import 'package:seesay/setting/how_to_use/how_to_use.dart';
import 'package:seesay/setting/setting2.dart';
import 'package:seesay/setting/team_info.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  List settingContents = [
    "User's Guide",
    "1",
    "2",
    "3",
    "4",
    "About us",
    "Privacy Policy",
  ];
  List settingPages = [
    const howToUse(),
    const setting2(),
    const setting2(),
    const setting2(),
    const setting2(),
    const teamInfo(),
    const setting2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFCE4040),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  "SeeSay",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCE4040),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.settings),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.person),
                            Expanded(
                                child: Text(
                              "Personal Information",
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                        ),
                        itemCount: 7,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => settingPages[index],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                height: 70,
                                color: Colors.white,
                                alignment: Alignment.centerLeft,
                                child: Text(settingContents[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
