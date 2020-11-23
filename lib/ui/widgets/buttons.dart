import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget customButton(){
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    height: 66,
    width: 66,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(33),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFF9E6B9), Color(0xFF6E3B3B)])
    ),
    child: Center(child: SvgPicture.asset('assets/plus.svg', width: 40,),)
  );
}


Widget changeQuantityButton(String text, VoidCallback onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 32, width: 32,
      decoration: BoxDecoration(
        color: Color(0xFFF3CF7A),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Center(child: Text(text)), 
    ),
  );
}

Widget primaryButton(String text){
  return Container(
    height: 56,
    width: 250,
    child: Center(child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: LinearGradient(
      begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFF9E6B9), Color(0xFF6E3B3B)])
    ),
  );
}

