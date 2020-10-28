import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class footer extends StatelessWidget {

  final features = ["Delivery within 2 hours", "No Preservatives", "Antibiotic Free", "No Chemicals"];
  final images = ["assets/motorcycle.png", "assets/no-drugs.png", "assets/chemical.png", "assets/chemical.png"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/food_delivery.png"),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,0, 0),
                          child: Text(
                            "Delivery within 2 hours",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/no-drugs.png"),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,0, 0),
                          child: Text(
                            "No Preservatives",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/chemical.png"),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,0, 0),
                          child: Text(
                            "Antibiotic Free",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/chemical.png"),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,0, 0),
                          child: Text(
                            "No Chemicals",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,40,0, 0),
              child: Text(
                "Follow Us On",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,10,0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image(
                        image: AssetImage("assets/facebook_logo.png"),
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image(
                        image: AssetImage("assets/instagram.png"),
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image(
                        image: AssetImage("assets/twitter.png"),
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,0,0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage("assets/visa.png"),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage("assets/maestro.png"),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage("assets/payu.png"),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,20,0, 0),
              child: Text(
                "2020 NonVegHouse. All Rights Reserved.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
