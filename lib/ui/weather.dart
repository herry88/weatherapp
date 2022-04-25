import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          dateSection,
          tempSection,
          SizedBox(height: 20.0,),
          descSection,
        ],
      ),
    );
  }

  Widget dateSection = Container(
    child: Text(
      DateFormat('MMMM d, H:m').format(DateTime.now()),
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  //tempSection
  Widget tempSection = Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '20',
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 12.0,
            ),
            margin: EdgeInsets.only(
              left: 6.0,
            ),
            child: Text(
              '\u2103',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/img/cloudy.png',
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );

  Widget descSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bekasi',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Cloudy',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
}
