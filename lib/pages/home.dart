import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data = {

    };
    @override
    Widget build(BuildContext context) {
        //here we will receive the arguments

        data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
        String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

        print(data);
        return Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/$bgImage'),
                        fit: BoxFit.cover
                    ),
                ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
                child: SafeArea (
                    child:Column(
                      children: <Widget>[
                        FlatButton.icon(
                            onPressed: () async {
                              //pushNamed accepts context object and the route we want to push the scree but when we push the screen it gets pushed above tthe main screen.We have pushed another screen onto the screen
                                // here we will wait for the changes to choose location file and the arguments will be stored in result
                              dynamic result = await Navigator.pushNamed(context,'/location');
                              setState(() {
                                  data = {
                                      //overriding data updating data
                                      'time': result['time'],
                                      'location': result['location'],
                                      'isDaytime': result['isDaytime'],
                                      'flag': result['flag']
                                  };
                              });

                            },
                            icon: Icon(Icons.edit_location),
                            label: Text('Edit Location')
                        ),
                          SizedBox(height: 20.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  Text(
                                      data['location'],
                                      style: TextStyle(
                                          fontSize: 28.0,
                                          letterSpacing: 2.0,
                                      ),
                                  ),
                              ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                              data['time'],
                              style: TextStyle(
                                  fontSize: 65.0,
                              ),
                          ),
                      ],
                    ),
                ),
              ),
            ),
        );

      }
}
