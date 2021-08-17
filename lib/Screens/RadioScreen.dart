import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('إسلامي',
              style:TextStyle(
                  color: Colors.black,
                  fontFamily: 'ELMessiri',
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Image(
                  image: AssetImage("assets/images/radio_icon.png")),
            ),
            Expanded(
              child: Text(
                'إذاعة القرآن الكريم',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ELMessiri',
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: [
              Expanded(
                child: InkWell(
                    child: Image(image: AssetImage("assets/images/metro-next.png"))),
              ),
              Expanded(
                child: InkWell(
                    child: Image(image: AssetImage("assets/images/awesome-play.png"))),
              ),
              Expanded(
                child: InkWell(
                    child: Container(child: Image(image: AssetImage("assets/images/metro_right.png")))),
              ),
            ]),
            SizedBox(height: 80),
          ]),
    );
  }
}