import 'package:safarny/screens/buypage.dart';

import '../animations/FadeAnimation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shoes extends StatefulWidget {
  final String image;

  const Shoes({required this.image});

  @override
  _ShoesState createState() => _ShoesState();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Shoes(
        image: '',
      ),
    );
  }
}

class _ShoesState extends State<Shoes> {
  bool clicked = false;
  bool clicked2 = false;
  bool clicked3 = false;
  bool clicked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
          child: Hero(
        tag: 'red',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeAnimation(
                              1.3,
                              Text(
                                "Dahab",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              1.4,
                              Text(
                                "Trip to dahab at 19/4",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          // FadeAnimation(
                          //   4,
                          //   SizedBox(
                          //     height: 20,
                          //     child: Text(
                          //       'Hold on Size',
                          //       style: TextStyle(
                          //           color: Colors.white, fontSize: 12),
                          //     ),
                          //   ),
                          // ),
                          FadeAnimation(
                              1.5,
                              Text(
                                'sadbsakjadbs ashdbakjdbsakj asdbasdbasjk askjdbaskjbdasjk asjkdbaksjdbsajbjaks dasj asjk asdjsa dkj askjas dksja sdakj',
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.5,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () => Get.offAll(() => BuyPage()),
                                  child: Text(
                                    'Buy Now',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
