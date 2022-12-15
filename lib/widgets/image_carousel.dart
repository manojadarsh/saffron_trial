import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

Widget imageCarousel = SizedBox(
  height: 150.0,
  width: 200,
  child: Carousel(
    borderRadius: false,

    //images in the carouosel to cover the entire container
    boxFit: BoxFit.cover,
    images: [
      AssetImage( 'assets/images/carousel/Landing001.png'),
      AssetImage('assets/images/carousel/Landing002.png'),
      AssetImage('assets/images/carousel/Landing003.png'),
    ],
    //can be true later - for speed better false
    autoplay: true,
    //hoow the mage will be processed
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(milliseconds: 1000),
    dotSize: 2.0,
    dotBgColor: Colors.transparent,
    indicatorBgPadding: 8.0,
  ),
);