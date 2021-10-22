// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO:: change the app name
      title: "Ahmed Hany",
      theme: ThemeData(
        //appBarTheme: AppBarTheme(color: Colors.teal),
        primaryColor: Colors.blueGrey,
        accentColor: Colors.lightBlue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.brown,
                // TODO :: Add your photo to assets
                backgroundImage: AssetImage("assets/images/SpiderMan.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: Text(
                  "Ahmed Hany",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ContactCard(
                myTitle: "+201152278227",
                myIcon: Icon(Icons.phone),
                myURL: "tel:+201152278227",
              ),

               ContactCard(
                myTitle: "ahmedhanya1000@gmail.com",
                myIcon: Icon(Icons.mail),
                myURL: "mailto:ahmedhanya1000@gamil.com?subject=News&body=New%20plugin",
              ),

              ContactCard(
                myTitle: "EL-PREMO",
                myIcon: Icon(Icons.facebook),
                myURL: "https://www.facebook.com/NomBer8",
              ),

              ContactCard(
                myTitle: "AhmedHany8",
                myIcon: Icon(EvaIcons.github),
                myURL: "https://github.com/AhmedHany8",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class ContactCard extends StatelessWidget {
  final String myTitle;
  final myIcon;
  final String myURL;
  const ContactCard({
    Key? key,
    required this.myTitle,
    required this.myIcon,
    required this.myURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.lightBlue,
      child: ListTile(
        onTap: () {
          _launchURL(myURL);
        },
        leading: myIcon,
        title: Text(
          myTitle,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
