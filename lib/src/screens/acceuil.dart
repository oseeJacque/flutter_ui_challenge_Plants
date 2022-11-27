// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plantes_design_ui/design/constColor.dart';
import 'package:plantes_design_ui/design/constText.dart';
import 'package:plantes_design_ui/src/screens/detailPage.dart';

import '../models/TextStyler.dart';
import '../models/fleur.dart';

class AcceuilPage extends StatefulWidget {
  AcceuilPage({Key? key}) : super(key: key);

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 2;
  List<Widget> listTitre = [
    const Tab(text: "All"),
    const Tab(text: " Indoor"),
    const Tab(text: "Outdoor"),
    const Tab(text: "Popular")
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: listTitre.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              _header(),
              const SizedBox(
                height: 25.0,
              ),
              _sousHead(context),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: TabBar(
                  automaticIndicatorColorAdjustment: false,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  labelPadding: const EdgeInsets.all(15.0),
                  unselectedLabelColor: const Color.fromARGB(68, 0, 0, 0),
                  unselectedLabelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black54),
                  splashBorderRadius:
                      const BorderRadius.all(Radius.circular(20.0)),
                  controller: _tabController,
                  tabs: listTitre,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: 400,
                child: TabBarView(controller: _tabController, children: [
                  Center(child: const Text("All Product")),
                  _indoor(),
                  Center(child: const Text("Outdorr")),
                  Center(child: const Text("Popular")),
                ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )),
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
        ));
  }

  ListView _indoor() {
    return ListView.builder(
        padding: const EdgeInsets.only(right: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: Fleure.listFleures.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(fleure:Fleure.listFleures[index])));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .45,
              height: MediaQuery.of(context).size.height * .45,
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.black12),
              child: Stack(
                children: [
                  Positioned(
                    top: 30.0,
                    right: -10.0,
                    child: Hero(
                      tag:Fleure.listFleures[index].imageUrl ,
                      child: Image(
                        image: AssetImage(Fleure.listFleures[index].imageUrl),
                        width: 150,
                      ),
                    ),
                  ),
                  Positioned(
                      left: -15.0,
                      top: MediaQuery.of(context).size.height * .2,
                      child: Transform.rotate(
                          angle: -pi / 2,
                          child: TextStyler(
                            Fleure.listFleures[index].name,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ))),
                  Positioned(
                      top: 15.0,
                      right: 15.0,
                      child: TextStyler(
                        "\$${Fleure.listFleures[index].price}",
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Positioned(
                      bottom: 20.0,
                      left: 15.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width*.25,
                            height: MediaQuery.of(context).size.height*.05,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: AppColors.bg),
                            child: TextStyler(
                              Texts.addToCar,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(
                            width: MediaQuery.of(context).size.width*.03,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width*.1,
                            height: MediaQuery.of(context).size.width*.1,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: Colors.black,
                            ),
                            child:  Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width*.07,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }

  Widget _sousHead(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: const EdgeInsets.only(left: 30.0, top: 0.0),
          width: MediaQuery.of(context).size.width * .92,
          height: MediaQuery.of(context).size.height*.15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: AppColors.wdbgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyler(
                Texts.trente,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextStyler(
                Texts.date,
                fontSize: 13.0,
              )
            ],
          )),
      const Positioned(
        right: 0.0,
        top: -30.0,
        bottom: 20.0,
        child: Image(
          image: AssetImage("assets/fonts/imagesF/begonia0.png"),
          width: 120,
          height: 100,
          fit: BoxFit.cover,
        ),
      )
    ]);
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyler(
            Texts.findFavorite,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: AppColors.bg,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    offset: Offset.fromDirection(0, 0),
                    spreadRadius: 2.0,
                    color: Colors.black38,
                  )
                ]),
            child: const Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
