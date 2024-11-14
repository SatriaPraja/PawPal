import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/theme.dart';

class myDrawer extends StatelessWidget {
  AuthController authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              // Text(
              //   "PawPal",
              //   style: TextStyle(
              //       fontSize: 50,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold),
              // ),
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Beranda",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Belanja",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Layanan",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_4_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profil",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Pengaturan",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          // logout
          Column(
            children: [
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () => authC.logout(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
