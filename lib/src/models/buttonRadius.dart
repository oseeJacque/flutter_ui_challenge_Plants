import 'package:flutter/material.dart';
import 'package:plantes_design_ui/design/constColor.dart';

class Uniforms{

  Widget ButtonRadius(Icon icon,Color color){
  return Container(
    width: 50,
    height: 50,
    color: color, 
    decoration: BoxDecoration(
      borderRadius:const BorderRadius.all(Radius.circular(100)),    
      boxShadow:[BoxShadow(
        blurRadius:5.0 , 
        spreadRadius: 7.0, 
        color: AppColors.bg
         )]  
       ),
       child: icon,
  );
}
}
