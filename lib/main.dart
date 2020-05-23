import 'package:flutter/material.dart';
//import 'pages/home.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main()=>runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        //they take context object as argument
        //here the home property that we use will cause an isse instead we can use
        //by default it is loading() but we can override dat using initialroute
        '/':(context) => Loading(),
        '/home':(context) => Home(),
        '/location':(context) => ChooseLocation(),
    },
));