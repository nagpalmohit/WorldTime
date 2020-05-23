import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
    @override
    _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

    void setupWorldTime() async {
        WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
        await instance.getTime();
        //here get time is an asynch function so it will not wait and willl try to print the time before it has fetched it so it is necessary
        // to put an await before accessing instance.getTime() but it will show u an error becouse ur getTime retruns nothing as output it return void
        //if we want to use await we need to use future<void> bit same as js promises

        //here what we did is that we add home page onto the stack
        //    Navigator.pushNamed(context, '/home');
        // instead of dis we need to put
        Navigator.pushReplacementNamed(context, '/home', arguments: {
            'location': instance.location,
            'flag': instance.flag,
            'time': instance.time,
            'isDaytime': instance.isDaytime
        });
    }

    @override
    void initState() {
        super.initState();
        setupWorldTime();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.blue[900],
            body: Center(
                child: SpinKitRing(
                    color: Colors.white,
                    size: 50.0,
                )
            )
        );
    }
}