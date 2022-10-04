

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plantes_design_ui/design/constColor.dart';
import 'package:plantes_design_ui/design/widgetsAll.dart';
import 'package:plantes_design_ui/src/models/TextStyler.dart';
import 'package:plantes_design_ui/src/models/fleur.dart';
import 'package:plantes_design_ui/src/screens/checkout.dart';

import '../../design/constText.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key, required this.newFleure}) : super(key: key);

  late Fleure newFleure;
  static List<Fleure> myCollection = [];
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  int nbr = 1;
  late double subTotal = 0.0;
  late double shipping = 0.0;

  void initState() {
    super.initState();
    MyCart.myCollection.add(widget.newFleure);
    for (Fleure fleure in MyCart.myCollection) {
      subTotal += fleure.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body:  SingleChildScrollView(
        child: Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05),
              child:Column(
                    children: [
                    Padding(
                    padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .05,
                    left: 20.0,
                    right: 20.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SampleWidget.radiusButtons(
                        icon: const Icon(Icons.arrow_back), ontapAction: () { Navigator.pop(context);}),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                    ),
                    TextStyler(
                      Texts.myCart,
                      fontSize: 15.0,
                    ),
                  ],
                ),
              ),
              _cartContains(),
              //,
              const SizedBox(
                height: 20.0,
              ),
                       
              Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * .1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _rowsBilan("Sub Total", "\$$subTotal"),
                      const SizedBox(
                        height: 15.0,
                      ),
                      _rowsBilan("Shipping", "\$$shipping"),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 10.0,
                        dashColor: Colors.black26,
                        //dashGradient: [Colors.red, Colors.blue],
                        //dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        //dashGapGradient: [Colors.red, Colors.blue],
                        dashGapRadius: 0.0,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      _rowsBilan("Total", "\$${subTotal + shipping}"),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.width * .15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          color: AppColors.btnColor,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()));
                            },
                            child: TextStyler(
                              Texts.checkout,
                              fontSize: 20.0,
                              color: AppColors.bg,
                            )),
                      ), 
                      const SizedBox(height: 30.0,)
                    ]),
              )
                    ],
                  ),
            ),
      ));
  
  }

  Widget _cartContains() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(right: 10.0),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: MyCart.myCollection.length,
      itemBuilder: (context, index){
        return Container(
          margin: const EdgeInsets.only(top: 30.0),
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height*.4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            color: AppColors.bg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*.4,
                height: MediaQuery.of(context).size.height*.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Color.fromARGB(57, 146, 142, 142),
                ),
                child: Image(
                  image: AssetImage(MyCart.myCollection[index].imageUrl),
                  width: MediaQuery.of(context).size.width*.4,
                  height: 150,
                ),
              ),
              const SizedBox(width: 10.0,),
              SizedBox(
                width: MediaQuery.of(context).size.width*.45,
                height: MediaQuery.of(context).size.height*.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextStyler(
                      MyCart.myCollection[index].name,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextStyler(
                      "Size: ${MyCart.myCollection[index].size[0]}",
                      fontSize: 15.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextStyler(
                      "\$${MyCart.myCollection[index].price}",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonAddRemove(() {
                                if (nbr > 1) {
                                  setState(() {
                                    nbr -= 1;
                                  });
                                }
                              }, Icons.remove),
                              const SizedBox(
                                width: 5.0,
                              ),
                              TextStyler(
                                nbr.toString(),
                                fontSize: 10.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              _buttonAddRemove(() {
                                setState(() {
                                  nbr += 1;
                                });
                              }, Icons.add)
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                size: 15.0,
                                color: Colors.black45,
                              ))
                        ])
                  ],
                ),
              ),
              
            ],
          ));}
    );
  }

  Widget _rowsBilan(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextStyler(
          title,
          fontSize: 15.0,
        ),
        TextStyler(
          data,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }

  Widget _buttonAddRemove(VoidCallback action, IconData icon) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: AppColors.bg,
            boxShadow: const [
              BoxShadow(spreadRadius: 1.0, color: Colors.black)
            ]),
        child: Icon(
          icon,
          size: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

