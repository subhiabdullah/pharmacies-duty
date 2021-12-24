import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pharmacies/main.dart';
import 'package:pharmacies/models/language.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    // TODO: implement initState

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 50.0, bottom: 20),
                child: Container(
                  color: Colors.purpleAccent[400],
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          NavegatorToBack();
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                      ),
                      Text(
                        'Settings'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75.0),
                        child: IconButton(
                          onPressed: () {
                            NavegatorToBack();
                          },
                          icon: Icon(Icons.settings),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      height: 15,
                      color: Colors.purpleAccent[400],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.translate,
                            size: 35,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: PopupMenuButton(
                            color: Colors.purpleAccent[400],
                            elevation: 20,
                            enabled: true,
                            child: Text(
                              'language'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            onCanceled: () {
                              //do something
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var locale = Locale('ar', '');
                                        Get.updateLocale(locale);
                                        //you can save this language on preference, and get on app start
                                      },
                                      child: Text(
                                        'Arabian'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    value: ElevatedButton,
                                  ),
                                  PopupMenuItem(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var locale = Locale('en', 'US');
                                        Get.updateLocale(locale);
                                        //you can save this language on preference, and get on app start
                                      },
                                      child: Text(
                                        'English'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    value: ElevatedButton,
                                  ),
                                  PopupMenuItem(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var locale = Locale('fr', '');
                                        Get.updateLocale(locale);
                                        //you can save this language on preference, and get on app start
                                      },
                                      child: Text(
                                        'french'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    value: ElevatedButton,
                                  ),
                                ]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      height: 15,
                      color: Colors.purpleAccent[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void NavegatorToBack() {
    Navigator.pop(context);
  }
}
