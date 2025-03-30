import 'package:flutter/cupertino.dart';
import 'package:weather_animation/weather_animation.dart';

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Stack(
      children: [
      ],
    );
  }


  Widget sun(size) {
    return SunWidget(
      sunConfig: SunConfig(
        width: size/3,
        blurSigma: 10.0,
        blurStyle: BlurStyle.solid,
        isLeftLocation: true,
        coreColor: Color(0xffffa726),
        midColor: Color(0xd6ffee58),
        outColor: Color(0xffff9800),
        animMidMill: 2000,
        animOutMill: 1800,
      ),
    );
  }


  Widget cloud(height, width) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: CloudWidget(
        cloudConfig: CloudConfig(
          size: height/5,
          x:width/6,
          scaleBegin: 1,
          scaleEnd: 1.2,
        ),
      ),
    );
  }

  Widget cloud2(height, width) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: CloudWidget(
        cloudConfig: CloudConfig(
          size: height/5,
          y:height/10,
          x:width/2,
          scaleBegin: 1,
          scaleEnd: 1.2,
        ),
      ),
    );
  }


}