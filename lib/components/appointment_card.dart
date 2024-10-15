import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Row(
                children: [
                   CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/doctor1.png'),
                  ),
                   SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr. Ela Kali',
                        style: TextStyle(
                          color: Config.whiteColor,
                        ),
                      ),
                       SizedBox(height: 2),
                      Text(
                        'Dental',
                        style: TextStyle(
                          color: Config.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Config.whiteColor,
                      ),
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 9, 209, 52),
                        foregroundColor: Config.whiteColor,
                      ),
                      onPressed: () {},
                      child: const Text('Completed'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Config.greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.whiteColor,
            size: 15,
          ),
           SizedBox(width: 5),
          Text(
            'Monday, 11,34,2022',
            style: TextStyle(
              color: Config.whiteColor,
            ),
          ),
           SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: Config.whiteColor,
            size: 17,
          ),
           SizedBox(width: 5),
           Flexible(
            child: Text(
              '2.00 PM',
              style: TextStyle(
                color: Config.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


