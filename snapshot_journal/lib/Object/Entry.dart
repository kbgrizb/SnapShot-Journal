import 'package:flutter/material.dart';


class Entry{

  Entry({
    required this.discription,
    required this.date,
    required this.picture,
    }
  );

String discription;

String date;

Image picture;


String getDis(){
  return discription;
}
}


