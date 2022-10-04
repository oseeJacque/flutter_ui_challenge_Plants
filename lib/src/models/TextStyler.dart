
import 'package:flutter/material.dart';

class TextStyler extends Text{
  TextStyler(String data,{Key? key, color:Colors.black,fontSize:10.0,fontWeight:FontWeight.normal,align:TextAlign.start}) : 
  super(key: key, 
  data, 
  style: TextStyle(
    color: color, 
    fontSize: fontSize, 
    fontWeight: fontWeight,    
  ),
  textAlign: align
  );
}