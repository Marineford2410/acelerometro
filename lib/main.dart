import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

main() => runApp(Controles());

class Controles extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Estado();
  }

}

class Estado extends State {

  AccelerometerEvent acelerometro;
  GyroscopeEvent giroscopio;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Acelerometro"),
        ),
        body: Container(
          height: 25,
          width: 25,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
              color: Colors.red,
              width: 5,

            ),
            borderRadius: BorderRadius.circular(15),

          ),
          margin: EdgeInsets.only(
            top: 300,     // 0 - 600
            left: calcularX(acelerometro.x),    // 0 - 400
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen(
            (AccelerometerEvent event) {
          // Do something with the event.
          setState(() {
            acelerometro = event;
            print('x : ${acelerometro.x.round()}, y : ${acelerometro.y.round()}, z : ${acelerometro.z.round()}');
          });
        }
    );
  }

  double calcularX(double acelX){
    double equis;
    if(acelX > -3 || acelX < 3){
      equis = (acelX + 3) * 100.00;
      return equis;
    }
  }


}