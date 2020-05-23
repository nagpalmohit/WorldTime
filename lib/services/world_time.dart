import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime{
    String location; // location name for UI
    String time; // the time in that location
    String flag; // url to an asset flag icon
    String url; // location url for api endpoint
    bool isDaytime; // true or false if daytime or not

    WorldTime({this.location,this.flag,this.url});
    Future<void> getTime() async {
        try {
            //it means it is a place holder value until it return and it wraps our void when asynch function is complete
            //make a request
            Response response = await get(
                'http://worldtimeapi.org/api/timezone/$url');
            Map data = jsonDecode(response.body);
            //print(data);


            //get the properties from data
            String datetime = data['datetime'];
            //this substring is done because the offset displays +01.00 as output but we dont need + in it
            String offset = data['utc_offset'].substring(1, 3);
            //    print(datetime);
            //    print(offset);

            //it will convert string to date time object
            DateTime now = DateTime.parse(datetime);
            //this will be used to add a specified object
            //now is non distructive so we have to do now = it does not directly update it
            now = now.add(Duration(hours: int.parse(offset)));

            isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
            time = DateFormat.jm().format(now);
        }
        catch (e) {
            print('Error:$e');
            time = 'could not load time';
        }
    }
}