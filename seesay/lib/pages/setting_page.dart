import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seesay/setting/how_to_use.dart';
import 'package:seesay/setting/privacy_policy.dart';
import 'package:seesay/setting/team_info.dart';

class SettingPage extends StatefulWidget {
  final String userEmail;
  final String photoURL;
  final String userName;

  const SettingPage({
    super.key,
    required this.userEmail,
    required this.photoURL,
    required this.userName,
  });

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
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: ,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                widget.photoURL,
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            // const Icon(Icons.person),
                            // const Expanded(
                            Text(
                              widget.userEmail,
                              textAlign: TextAlign.center,
                            ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                  child: const Text(
                                    "Logout",
                                    style: TextStyle(fontSize: 15),
                                  ),
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
                                      child: Text(
                                        settingContents[index],
                                        style: const TextStyle(fontSize: 15),
                                      ),
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
