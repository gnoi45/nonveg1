import 'dart:convert';

import 'package:fipola_app/model/Product.dart';
import 'package:fipola_app/screens/ProductDetail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class bestsellers extends StatelessWidget {
  final id=["20", "19", "18", "17"];
  final products = ["Country Eggs", "White Eggs", "Shark Cut Peices", "Anchovy Nethili Fish (Full Peice)"];
  final images = ["https:\/\/shopninja.in\/nonveg\/superadmin\/assets\/products\/country_eggs.jpg", "https:\/\/shopninja.in\/nonveg\/superadmin\/assets\/products\/white-farm-broiler-eggs.png","https:\/\/shopninja.in\/nonveg\/superadmin\/assets\/products\/shark_curry_skinless_cut.jpg" ,"https:\/\/shopninja.in\/nonveg\/superadmin\/assets\/products\/nethili_fish.JPG"];
  final prices = ["96", "50", "620", "155"];
  final short_desc = ["Free range eggs which are rich in protein and vitamins", "Eggs are high protein food", "Bursting with the goodness of omega-3 fatty acids, this shark fish & which can be cooked in numerous ways, makes a perfect starter for your meal", "Bursting with the goodness of omega-3 fatty acids, this small fish which can be cooked innumerous ways, makes a perfect starter for your meal"];
  final long_desc = ["Free range eggs which are rich in protein and vitamins", "Eggs are high protein food", "Bursting with the goodness of omega-3 fatty acids, this shark fish & which can be cooked in numerous ways, makes a perfect starter for your meal", "Bursting with the goodness of omega-3 fatty acids, this small fish which can be cooked innumerous ways, makes a perfect starter for your meal"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Text(
                'Best Sellers of the Month',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: Container(
              height: 290,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(value : Product(
                          image: images[index],
                          title: products[index],
                          short_desc: short_desc[index],
                          long_desc: long_desc[index],
                          price: prices[index],
                          id:id[index],
                        ))));
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Card(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10,15,10,0),
                                  child: Text(
                                    products[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,5,0,0),
                                  child: Text(
                                    "Rs " + prices[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}