import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:shimmer/shimmer.dart';

import 'home_page.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _HomePagePharmceState createState() => _HomePagePharmceState();
}

class _HomePagePharmceState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[400],
      appBar: homeAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/logopharm.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'About the app'.tr,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'information app'.tr,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'تم تنفيذه ضمن ورشة دعم المشاريع الإنمائية',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'صبحي عبد الله - علي محمد - جعفر ميا - عبد الله حايك - إيهاب حبيب',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lightBlueAccent[400],
      title: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.amberAccent,
        child: Row(
          children: [
            Text(
              'Syria Pharmacies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
