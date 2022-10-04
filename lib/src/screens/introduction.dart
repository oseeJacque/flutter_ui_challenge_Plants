import 'package:flutter/material.dart';
import 'package:plantes_design_ui/design/widgetsAll.dart';
import 'package:plantes_design_ui/design/constColor.dart';
import 'package:plantes_design_ui/design/constText.dart';
import 'package:plantes_design_ui/src/models/TextStyler.dart';
import 'package:plantes_design_ui/src/models/fleur.dart';
import 'package:plantes_design_ui/src/screens/acceuil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    PageController pageContoller = PageController();
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Stack(
          children: [
            PageView(
              controller: pageContoller,
              scrollDirection: Axis.horizontal,
              children: [
                _buildPageView(context, Fleure.Imgaes[0]),
                _buildPageView(context, Fleure.Imgaes[1]),
                _buildPageView(context, Fleure.Imgaes[2]),
              ],
            ),
            Positioned(
                bottom: 30.0,
                left: MediaQuery.of(context).size.width * 0.40,
                right: MediaQuery.of(context).size.width * 0.40,
                child: Column(
                  children: [SmoothPageIndicator(
                    controller: pageContoller,
                    count: 3,
                    effect:  SlideEffect(
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 24.0,
                        dotHeight: 5.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: AppColors.btnColor),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0, 
                    decoration: BoxDecoration(color: AppColors.btnColor,
                    borderRadius: const BorderRadius.all(Radius.circular(100)), 
                    boxShadow:const  [
                      BoxShadow(
                        spreadRadius: 1.0, 
                        blurRadius: 2.0
                      )
                    ] 
                    ),
                    child: TextButton(
                      onPressed:( ){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>  AcceuilPage()));
                      },
                      child: TextStyler(Texts.go,fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0,)),
                  )
                  ]
                )),
            SampleWidget.builbes(
                top: MediaQuery.of(context).size.width * .38,
                bottom: MediaQuery.of(context).size.height * .48,
                left: MediaQuery.of(context).size.width * .88,
                right: -MediaQuery.of(context).size.height * .25),
            SampleWidget.builbes(
                top: MediaQuery.of(context).size.width * .99,
                bottom: MediaQuery.of(context).size.height * .1,
                left: -MediaQuery.of(context).size.height * .25,
                right: MediaQuery.of(context).size.width * .9),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(BuildContext context, String url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: TextStyler(
              Texts.planto,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        TextStyler(
          Texts.planta,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          align: TextAlign.center,
        ),
        const SizedBox(
          height: 30.0,
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height*.4,
          child: Image(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 15.0,),
        Padding(
          padding: const EdgeInsets.all(0.0), 
          child: TextStyler(Texts.worldwide,fontSize: 20.0,), 
          ),
          const SizedBox(height: 15.0,),
      ],
    );
  }

}
