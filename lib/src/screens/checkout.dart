import 'package:flutter/material.dart';
import 'package:plantes_design_ui/design/constColor.dart';
import 'package:plantes_design_ui/design/widgetsAll.dart';

import '../../design/constText.dart';
import '../models/TextStyler.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _value=2;
  int index=3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200))),
              elevation: 2.0,
              height: 60.0,
              backgroundColor: AppColors.bg,
              indicatorColor: Colors.black),
          child: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (int value) {
                setState(() {
                  index = value;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: "",
                  selectedIcon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite_border),
                  label: "",
                  selectedIcon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                NavigationDestination(
                    icon: Icon(Icons.camera_alt_sharp),
                    label: "",
                    selectedIcon: Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                    )),
                NavigationDestination(
                  icon: Icon(Icons.lock),
                  label: "",
                  selectedIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                NavigationDestination(
                    icon: Icon(Icons.person_rounded),
                    label: "",
                    selectedIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ))
              ]),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .1,
              left: MediaQuery.of(context).size.width * .03,
              right: MediaQuery.of(context).size.width * .03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        SampleWidget.radiusButtons(
                            icon: const Icon(Icons.arrow_back),
                            ontapAction: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                        ),
                        TextStyler(
                          Texts.checkout,
                          fontSize: 15.0,
                        ),
                      ],
                    )),

                Center(
                  child: Column(
                    children: [
                      Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: TextStyler(
                      Texts.delivery,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                color: Colors.black12),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyler(
                                Texts.dates,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextStyler(
                                Texts.newyORK,
                                fontSize: 15.0,
                              )
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color: Colors.black26,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                TextStyler(
                  Texts.payement,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.black12),
                            child: const Image(
                              image: AssetImage(
                                  "assets/fonts/imagesF/mastercard-.png"),
                              width: 30,
                              height: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              TextStyler(
                                "MasterCard Pay",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextStyler(
                                "........ 0357 8420",
                                fontSize: 15.0,
                              )
                            ],
                          )
                        ],
                      ),
                      Radio(
                        activeColor: Colors.green,
                        value: 1, 
                        groupValue: _value, 
                        onChanged: ((value) {
                          setState(() {
                            _value=value as int;
                          });
                        }
                        ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.black12),
                              child: const Image(
                                image: AssetImage(
                                  "assets/fonts/imagesF/apple-.png",
                                ),
                                width: 30.0,
                                height: 30.0,
                              )),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              TextStyler(
                                "Apple Pay",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextStyler(
                                "........ 0357 8420",
                                fontSize: 15.0,
                              )
                            ],
                          )
                        ],
                      ),
                      Radio(
                        activeColor: Colors.green,
                        value: 2, 
                        groupValue: _value, 
                        onChanged: ((value) {
                          setState(() {
                            _value=value as int;
                          });
                        }
                        ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.black12),
                              child: const Image(
                                image: AssetImage(
                                    "assets/fonts/imagesF/paypal.png"),
                                width: 30.0,
                                height: 30.0,
                              )),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: [
                              TextStyler(
                                "PayPal Pay",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextStyler(
                                "........ 0357 8420",
                                fontSize: 15.0,
                              )
                            ],
                          )
                        ],
                      ),
                      Radio(
                        activeColor: Colors.green,
                        value: 3, 
                        groupValue: _value, 
                        onChanged: ((value) {
                          setState(() {
                            _value=value as int;
                          });
                        }
                        ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.8,
                  height:MediaQuery.of(context).size.width*.1,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                     child: TextStyler("Paymenth",fontSize: 20.0,color: AppColors.bg,), 
                     style:ButtonStyle(
                      shape:MaterialStateProperty.all( RoundedRectangleBorder(borderRadius:BorderRadiusDirectional.circular(30.0) ,
                      ),),
                      backgroundColor:MaterialStateProperty.all(AppColors.btnColor),
                       
                     ) ,
                     ),
                )
                
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
