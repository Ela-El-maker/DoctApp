import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Config.whiteColor,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.3,
                child: Image.asset(
                  'assets/images/doctor1.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr. Ela Kali',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cardiology',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.amberAccent,
                            size: 16,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text('4.5'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('(120)'),
                          Spacer(
                            flex: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: (){},// To Doctor DEtails
      ),
    );
  }
}
