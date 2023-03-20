import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seesay/setting/how_to_use.dart';
import 'package:seesay/setting/setting2.dart';
import 'package:seesay/setting/team_info.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  List settingContents = [
    "User's Guide",
    "About us",
    "Privacy Policy",
    // "Logout (표시되면 안됨)",
  ];

  List settingPages = [
    const howToUse(),
    const teamInfo(),
    const setting2(),
    // const setting2(),
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
                        itemCount: 4,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          if (index == settingContents.length) {
                            return GestureDetector(
                              onTap: () {
                                signUserOut();
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  height: 70,
                                  color: Colors.white,
                                  alignment: Alignment.centerLeft,
                                  child: const Text("Logout"),
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            settingPages[index],
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Container(
                                      height: 70,
                                      color: Colors.white,
                                      alignment: Alignment.centerLeft,
                                      child: Text(settingContents[index]),
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => signUserOut(),
                                //       ),
                                //     );
                                //   },
                                //   child: Padding(
                                //     padding:
                                //         const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                //     child: Container(
                                //       height: 70,
                                //       color: Colors.white,
                                //       alignment: Alignment.centerLeft,
                                //       child: Text(settingContents[index]),
                                //     ),
                                //   ),
                                // ),
                              ],
                            );
                          }
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
