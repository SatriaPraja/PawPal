import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileController profilC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return Scaffold(
        drawer: kIsWeb ? null : myDrawer(),
        appBar: screenWidth > 1000 && kIsWeb
            ? AppBar(
                title: MyAppbar(),
                automaticallyImplyLeading: !kIsWeb,
                leading: kIsWeb ? null : null,
              )
            : AppBar(
                title: Text("Profile"),
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"), 
                    radius: 50,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Dimas Sodiin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "sodiindimas@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  width: context.width * 0.9,
                  decoration: BoxDecoration(color: thirdColors),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Akun Saya",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.co_present_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Informasi Pribadi",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.language_rounded),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Bahasa",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Bahasa (ID)",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.privacy_tip),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Kebijakan Privasi",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Pengaturan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: context.width * 0.9,
                  decoration: BoxDecoration(color: thirdColors),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notifikasi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.notifications_active_outlined),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Notifikasi Push",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: controller.isSwitchedOn1.value,
                              onChanged: (value) {
                                controller.toggleSwitch1(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.notification_add_outlined),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Notifikasi Promosi",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: controller.isSwitchedOn2.value,
                              onChanged: (value) {
                                controller.toggleSwitch2(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: context.width * 0.9,
                  decoration: BoxDecoration(color: thirdColors),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lainnya",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.help_outline_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Pusat Bantuan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
