import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  CurvedContainer({this.text, this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 5.0),
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color(0xFFEADCCD),
        shape: BoxShape.circle,
      ),
    );
  }
}

class Activity extends StatelessWidget {
  final String date;
  final String title;
  final String type;
  final String cost;
  final Color color;
  final bool hide;
  Activity(
      {this.color, this.title, this.date, this.cost, this.type, this.hide});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            MyBullet(),
            Column(
              children: List.generate(
                3,
                (ii) => Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child: Container(
                      height: 5,
                      width: 2,
                      color: hide ? Colors.white : Color(0xFFEADCCD),
                    )),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              date,
              style: TextStyle(color: Color(0xFF8B979E)),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              cost,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              type,
            ),
          ],
        )
      ],
    ));
  }
}

class AddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xFF101645),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          Text(
            'Add new',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
