import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/slider_dot.dart';
import 'models/weather_location.dart';
import 'single_weather.dart';


class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentpage = 0;
  late String bgImg;

  _onPageChanged(int index) {
    setState(() {
      _currentpage = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    if(locationList[_currentpage].weatherType=='Sunny'){
      bgImg = 'assets/sunny.jpg';
    }
    if(locationList[_currentpage].weatherType=='Night'){
      bgImg = 'assets/night.jpg';
    }
    if(locationList[_currentpage].weatherType=='Rainy'){
      bgImg = 'assets/rainy.jpg';
    }
    if(locationList[_currentpage].weatherType=='Cloudy'){
      bgImg = 'assets/cloudy.jpg';
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.search), onPressed: () {  },
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),

            child: GestureDetector(
              onTap: () => print('menu detected'),
              child: SvgPicture.asset('assets/menu.svg',
              height: 30,
                width: 30,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

        body: Container(
          child: Stack(
            children: [
              Image.asset(bgImg,
              fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black38),
              ),
              Container(
                margin: EdgeInsets.only(top: 140, left: 15),
                child: Row(
                  children: [
                    for(int i = 0; i<locationList.length; i++)
                      if( i == _currentpage )
                        SliderDot(true)
                      else
                        SliderDot(false)

                  ],
                ),
              ),

              PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: _onPageChanged,
                itemCount: locationList.length,
                itemBuilder: (ctx,i) => SingleWeather(i),
              ),


            ],
          )
        ),
      );
  }
}
