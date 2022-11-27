import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plantes_design_ui/design/constColor.dart';
import 'package:plantes_design_ui/design/constText.dart';
import 'package:plantes_design_ui/src/models/TextStyler.dart';
import 'package:plantes_design_ui/src/screens/checkout.dart';
import 'package:plantes_design_ui/src/screens/myCart.dart';

import '../../design/widgetsAll.dart';
import '../models/fleur.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.fleure}) : super(key: key);

  late Fleure fleure;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int index=1;
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
              top: MediaQuery.of(context).size.width * .070,
              right: MediaQuery.of(context).size.width * .025,
              left: MediaQuery.of(context).size.width * .025),
          child: Column(
            //clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: _header(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .08,
                left: MediaQuery.of(context).size.height * .01,
                right: MediaQuery.of(context).size.height * .01,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.width * .6,
                      child: Hero(
                        tag: widget.fleure.imageUrl,
                        child: Image(
                          image: AssetImage(widget.fleure.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextStyler(
                            widget.fleure.name,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(children: [
                            RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Color.fromARGB(145, 37, 226, 113),
                              ),
                              itemCount: 1,
                              itemSize: 30.0,
                              direction: Axis.vertical,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: widget.fleure.price.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: widget.fleure.review,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black))
                                ]))
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                          text: TextSpan(
                              text: widget.fleure.desc,
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(text: "..."),
                            TextSpan(
                                text: "Read more",
                                style: TextStyle(
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.bold))
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _fleureAttribut("Size", widget.fleure.size, 15.0),
                          _fleureAttribut("Plant", widget.fleure.plant, 15.0),
                          _fleureAttribut(
                              "Height", widget.fleure.height.toString(), 15.0),
                          _fleureAttribut(
                              "Humidnity", widget.fleure.humidity, 15.0)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _fleureAttribut(
                              "Price", "\$${widget.fleure.price}", 20.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.width * .12,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(newFleure: widget.fleure)));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.btnColor),
                              ),
                              child: TextStyler(
                                Texts.addToCar,
                                fontSize: 20.0,
                                color: AppColors.bg,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SampleWidget.radiusButtons(
            icon: const Icon(Icons.arrow_back),
            ontapAction: () {
              Navigator.pop(context);
            }),
        SizedBox(
          width: 70,
          height: 30,
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)))),
                  shadowColor: MaterialStateProperty.all(Colors.black)),
              child: TextStyler(
                Texts.detail,
                fontSize: 15.0,
              )),
        ),
        SampleWidget.radiusButtons(
            icon: const Icon(Icons.favorite_border), ontapAction: () {}),
      ],
    );
  }

  Widget _fleureAttribut(String title, String value, double size) {
    return Column(
      children: [
        TextStyler(
          title,
          fontSize: size,
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextStyler(
          value,
          fontSize: size,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
