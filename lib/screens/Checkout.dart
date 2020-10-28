import 'dart:convert';

import 'package:fipola_app/screens/AddAddress.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

import 'CancellationPolicy.dart';
import 'Cart.dart';
import 'OrderSuccessful.dart';


String pricex;
String order_idx;
String address="";
int x=0;
int total;

class Checkout extends StatefulWidget {
  Checkout(String price,String order_id)
  {
    pricex=price;
    x=int.parse(pricex)*100;
    order_idx=order_id;
  }

  @override
  State<StatefulWidget> createState() {
    return Checkoutu();
  }
}


String totalPrice()
{
  int xx=int.parse(pricex) + int.parse("50");
  x=xx*100;
  return xx.toString();
}


Future<String> saveorder(String mode,String payment_status,String payment_id,String amount,BuildContext context) async {
  final response = await http.post(
      AppUrl.SAVE_ORDER,
      body: {
        "user_id": "" + xx_id,
        "order_id":""+order_idx,
        "mode":""+mode,
        "payment_status":""+payment_status,
        "payment_id":""+payment_id,
        "amount":""+amount,
      });

  final data = jsonDecode(response.body);
  int value = data['status'];

  if (value == 200) {
    String nameAPI = data['msg'];

    //loginToast(nameAPI);

    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new OrderSuccessful();
    }));
  } else {

    print("fail");
    //loginToast("Some Error Occurred");
  }
}




class Checkoutu extends State<Checkout> {
  Razorpay _razorpay;
  TextEditingController myController;
  final controller1 = new TextEditingController();
  int selectedRadio;
  bool checkboxValue = false;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    getAddress();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  setSelectedRadio(int index){
    setState(() {
      selectedRadio = index;
    });
  }


  Future<String> getAddress() async {
    final response = await http.post(
        "https://shopninja.in/nonveg/api2/public/index.php/getUserprofile",
        body: {
          "user_id": "" + xx_id,
        });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      String plot = data['msg']['plot_no'];
      String street = data['msg']['street'];
      String area = data['msg']['area'];
      String city = data['msg']['city'];
      String state = data['msg']['state'];
      String pincode = data['msg']['pincode'];

      if(plot==null || plot.isEmpty)
      {
        setState(() {
          myController = TextEditingController(text: "Not Found");
        });

      }
      else {
        address =
            plot + "," + street + "\n" + area + "," + city + "\n" + state +
                "\n" + pincode;

        setState(() {
          myController = TextEditingController(text: address);
        });
      }


    } else {

      print("fail");
      //loginToast("Some Error Occurred");
    }
  }


  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
    controller1.dispose();
  }


  @override
  Widget build(BuildContext context) {
    DateTime _dateTime;
    var formattedDate;
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay picked;
    Future<Null> selectTime(BuildContext context) async{
      picked = await showTimePicker(
        context: context,
        initialTime: _time,
      );
      setState(() {
        _time = picked;
        print(_time);
      });
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom :10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Order Cost", style: TextStyle(fontSize: 15, color: Colors.grey),)
                              ),
                              Text("Rs "+pricex,  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom :10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Processing Charges", style: TextStyle(fontSize: 15, color: Colors.grey),)
                              ),
                              Text("Rs 50", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom :10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Total Charges", style: TextStyle(fontSize: 16, color: Colors.grey),)
                              ),
                              Text("Rs " + totalPrice(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Text(
                  ''+myController.text,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAddress()),
                  )
                },
                child:Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: Text(
                    'Update Address',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.fromLTRB(15, 20, 10, 0),
              //   child: Text(
              //     'Please schedule for the delivery in case you want the product to be delivered at a particular time.',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              //   child: TextField(
              //     onTap: (){
              //       showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2030)).then((date){
              //         setState(() {
              //           _dateTime = date;
              //           formattedDate = "${date.day}-${date.month}-${date.year}";
              //         });
              //       });
              //     },
              //     decoration: InputDecoration(
              //       hintText: _dateTime == null ? 'Select Date' : formattedDate,
              //       prefixIcon: Icon(Icons.date_range, color: Theme.of(context).accentColor,),
              //       labelStyle: TextStyle(color: Colors.grey),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //     ),
              //     keyboardType: TextInputType.datetime,
              //     style: TextStyle(color: Colors.grey),
              //     cursorColor: Colors.grey,
              //     controller: controller1,
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              //   child: TextField(
              //     onTap: (){
              //       selectTime(context);
              //     },
              //     decoration: InputDecoration(
              //       hintText: picked == null ? 'Select Time' : picked,
              //       prefixIcon: Icon(Icons.timer, color: Theme.of(context).accentColor,),
              //       labelStyle: TextStyle(color: Colors.grey),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //     ),
              //     keyboardType: TextInputType.datetime,
              //     style: TextStyle(color: Colors.grey),
              //     cursorColor: Colors.grey,
              //     controller: controller1,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                child: Text(
                  'Mode of Payment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (index){
                      print("radio pressed at $index");
                      setSelectedRadio(index);
                    },
                  ),
                  new Text(
                    'Pay Online',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  new Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (index){
                      print("radio pressed at $index");
                      setSelectedRadio(index);
                    },
                  ),
                  new Text(
                    'Cash On Delivery',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: checkboxValue,
                    onChanged: (bool value){
                      print(value);
                      setState(() {
                        checkboxValue = value;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'I Agree to the ',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CancellationPolicy()));
                        },
                        child: Text(
                          'Cancellation Policy ',
                          style: new TextStyle(color: Colors.red,fontSize: 16.0, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 0),
                child: ButtonTheme(
                  buttonColor:Colors.amber,
                  minWidth: double.infinity,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      if(checkboxValue == false){
                        toastMessage("Please check the cancellation policy");
                      }
                      else if(myController.text.isEmpty){
                        toastMessage("Please enter address");
                      }
                      else{
                        switch(selectedRadio){
                          case 0:
                            if(myController.text.contains("Not Found"))
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                return new AddAddress();
                              }));
                            }
                            else
                              startPayment();
                            break;
                          case 1:
                            if(myController.text.contains("Not Found"))
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                return new AddAddress();
                              }));
                            }
                            else
                              saveorder("1", "", "", pricex, context);
                            break;
                        }
                      }

                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startPayment() async {
    var options = {
      'key': 'rzp_live_Gr62yIQq7GZDTL',
      'amount': x.toString(),
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
    saveorder("2", "1", ""+response.paymentId, pricex, context);

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);₧
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }
}