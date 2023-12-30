import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

const bannerColor = Colors.orange;

AppBar defaultbanner(BuildContext context, String myText) {
    return AppBar(
      
        title: Text(myText),
        backgroundColor: onuOrange  
    );
    
  }