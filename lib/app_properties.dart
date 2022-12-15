import 'package:flutter/material.dart';

TextStyle textFieldStyle() {
  return TextStyle(color: green);
}

TextStyle textFieldStyleSize(double size) {
  return TextStyle(color: green, fontSize: size );
}

TextStyle textFieldStyleSizeColor(double size, Color color) {
  return TextStyle(color: color, fontSize: size );
}

InputDecoration textFieldInputDecoration(String hintText, IconData hintIcon,double height ) {
  return InputDecoration(
    prefixIcon:  Icon(hintIcon, color: green,),
    contentPadding: EdgeInsets.symmetric(vertical: height/45),
    fillColor: lightgreen,
    filled: true,
    hintText: hintText,
    border:  OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none
      ),
      borderRadius:  BorderRadius.circular(12.0),
    ),
    hintStyle: TextStyle(
      color: green,
    ),

  );
}

TextStyle buttonText() {
  return TextStyle(
    color: white,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}

TextStyle bottomAppBarText() {
  return TextStyle(
    color: grey,
    fontWeight: FontWeight.w300,
    fontSize: 15,
  );
}

TextStyle headingTextStyle() {
  return TextStyle(
    color: green,
    fontWeight: FontWeight.w400,
    fontSize: 25,
  );
}

void changeScreenPush(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenPushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

final green = const Color(0xff1C982F);
final lightgreen = const Color(0xffE7F5E9);
final darkgreen = Colors.green;
final grey = Colors.grey;
final white = Colors.white;
final transpLightGreen =  Colors.lightGreen.withOpacity(0.5);
const transp = Colors.white60;
const lightgrey = Color(0xffD3D3D3);
const darkgrey = Colors.grey;
const red = const Color(0xffA02B2B);

var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget consectetur risus. Sed fermentum leo condimentum, vestibulum lorem hendrerit, bibendum diam. Nam et erat in lacus malesuada dignissim. Mauris vestibulum luctus mauris, sed consequat lacus scelerisque id. Cras commodo rhoncus velit, ac interdum quam ultrices vel. Etiam at euismod tellus. Quisque fringilla tortor vel ligula euismod iaculis et in purus. Mauris tincidunt purus pellentesque, finibus metus et, pharetra turpis. Sed fermentum, orci sit amet bibendum faucibus, est dolor feugiat ante, eget egestas lorem dolor vel velit. Vivamus eleifend neque turpis, vitae dignissim lorem ullamcorper at. Aenean condimentum tempor tellus, eu tincidunt nunc lobortis eget. Ut fermentum, lorem at viverra sodales, ante neque dignissim urna, et egestas erat ipsum non felis. Nullam eleifend elit vitae risus eleifend, et volutpat arcu molestie. Vivamus finibus malesuada nunc, id laoreet massa ultricies sed. In viverra venenatis convallis. Proin non lacinia magna, at eleifend tortor.";


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
