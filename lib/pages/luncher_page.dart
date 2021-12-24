import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:shimmer/shimmer.dart';

import 'home_page.dart';
import 'package:flutter/services.dart';
import 'package:pharmacies/models/pharmacies.dart';
import 'package:pharmacies/utils/connection.dart';

class LuncherPagePharmc extends StatefulWidget {
  const LuncherPagePharmc({Key? key}) : super(key: key);

  @override
  _LuncherPagePharmState createState() => _LuncherPagePharmState();
}

class _LuncherPagePharmState extends State<LuncherPagePharmc> {
  List<City> _cities = [];
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getPharmacies().then((cities) {
      _cities = cities;
    });
    Future.delayed(Duration(seconds: 9)).then(
      (value) {
        if (_cities.isEmpty) {
          _showErrorDialog().then((value) {
            SystemNavigator.pop();
          });
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return GoogleMapPage2(_cities);
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LuncherPage(),
    );
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Error!!',
            style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Please check the internet service on your mobile.',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LuncherPage extends StatelessWidget {
  const LuncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 125),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  ListView(
                    children: [
                      prodcard(size: MediaQuery.of(context).size),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('images/logopharm.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                        child: Text(
                          ' SYRIA PHARMACIES ',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        baseColor: Colors.white,
                        highlightColor: Colors.yellowAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class prodcard extends StatelessWidget {
  const prodcard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 190,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 25,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              width: 200,
              child: Image.asset(
                'images/logopharm.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: SizedBox(
              height: 135,
              width: size.width - 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '  Syria Pharmacies',
                      style: TextStyle(
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 90,
                      child: Text(
                        'messge luncher'.tr,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
