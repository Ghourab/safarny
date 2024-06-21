import 'package:safarny/screens/Shoes.dart';
import 'package:safarny/screens/sneakers.dart';

import '../animations/FadeAnimation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/bg_data.dart';

class HomePage extends StatelessWidget {
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/header.jpg"),
                    fit: BoxFit.fill),
                color: Colors.white54,
              ),
              child: const Text(
                "",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text(
                "Home",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text(
                "Setting",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.pages,
                color: Colors.black,
              ),
              title: const Text(
                "Products",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          "Shoes",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgList[selectedIndex]), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: FadeAnimation(
                            1,
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: GestureDetector(
                          onTap: () => Get.to(() => Sneakers()),
                          child: FadeAnimation(
                              1.1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    "19/4",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: GestureDetector(
                          onTap: () => {},
                          child: FadeAnimation(
                              1.2,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    "Football",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: GestureDetector(
                          onTap: () => {},
                          child: FadeAnimation(
                              1.3,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    "Running",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: GestureDetector(
                          onTap: () => {},
                          child: FadeAnimation(
                              1.4,
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Center(
                                  child: Text(
                                    "Air",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.5,
                    makeItem(
                        image: 'assets/images/img1.jpeg',
                        tag: 'Running1',
                        context: context,
                        name: "Run",
                        price: 60)),
                FadeAnimation(
                    1.6,
                    makeItem(
                        image: 'assets/images/img2.jpg',
                        tag: 'Sneakers1',
                        context: context,
                        name: "19/4",
                        price: 100)),
                FadeAnimation(
                    1.7,
                    makeItem(
                        image: 'assets/images/three.jpg',
                        tag: 'Sneakers2',
                        context: context,
                        name: "Sneakers",
                        price: 100)),
                FadeAnimation(
                    1.8,
                    makeItem(
                        image: 'assets/images/six.jpg',
                        tag: 'Running2',
                        context: context,
                        name: "Run",
                        price: 60)),
                FadeAnimation(
                    1.9,
                    makeItem(
                        image: 'assets/images/seven.jpg',
                        tag: 'Sneakers3',
                        context: context,
                        name: "Sneakers",
                        price: 100)),
                FadeAnimation(
                    1.9,
                    makeItem(
                        image: 'assets/images/eight.jpg',
                        tag: 'Air1',
                        context: context,
                        name: "Jordan",
                        price: 130)),
                FadeAnimation(
                    1.9,
                    makeItem(
                        image: 'assets/images/nine.jpg',
                        tag: 'Air2',
                        context: context,
                        name: "Jordan",
                        price: 130)),
                FadeAnimation(
                    1.9,
                    makeItem(
                        image: 'assets/images/ten.jpg',
                        tag: 'Sneakers4',
                        context: context,
                        name: "Sneakers",
                        price: 100)),
                FadeAnimation(
                    1.9,
                    makeItem(
                        image: 'assets/images/eleven.jpg',
                        tag: 'Air3',
                        context: context,
                        name: "Air",
                        price: 160)),
                FadeAnimation(
                    2.0,
                    makeItem(
                        image: 'assets/images/AirJordan.jpg',
                        tag: 'Air4',
                        context: context,
                        name: "Jordan",
                        price: 130)),
                FadeAnimation(
                    2.1,
                    makeItem(
                        image: 'assets/images/Airjordan2.jpg',
                        tag: 'Air5',
                        context: context,
                        name: "Jordan",
                        price: 130)),
                FadeAnimation(
                    2.2,
                    makeItem(
                        image: 'assets/images/football1.jpg',
                        tag: 'Football1',
                        context: context,
                        name: "Football",
                        price: 200)),
                FadeAnimation(
                    2.3,
                    makeItem(
                        image: 'assets/images/running2.jpg',
                        tag: 'Running3',
                        context: context,
                        name: "Run",
                        price: 60)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context, name, price}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Shoes(
                        image: image,
                      )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Dahab",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.1,
                            Text(
                              name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.2,
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ))
                ],
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    "$price\$",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
