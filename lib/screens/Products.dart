import 'dart:convert';
import 'dart:io';

import 'package:fipola_app/model/Product.dart';
import 'package:fipola_app/screens/ChickenProducts.dart';
import 'package:fipola_app/screens/ComboProducts.dart';
import 'package:fipola_app/screens/EggProducts.dart';
import 'package:fipola_app/screens/FishProducts.dart';
import 'package:fipola_app/screens/GoatProducts.dart';
import 'package:fipola_app/screens/SpicesProducts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import 'ProductDetail.dart';

class Products extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Shop',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'CHICKEN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'GOAT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'FISH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'EGG',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'COMBO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'SPICES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: containers,
          ),
        ),
      ),
    );
  }

  List<Widget> containers = [
    ChickenProducts(),
    GoatProducts(),
    FishProducts(),
    EggProducts(),
    ComboProducts(),
    SpicesProducts(),
  ];
}

