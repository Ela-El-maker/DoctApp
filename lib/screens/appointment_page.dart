import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming; // initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      'doctor_name': 'John Doe',
      'doctor_profile': 'assets/images/profile3.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Jane Doe',
      'doctor_profile': 'assets/images/profile4.png',
      'category': 'Cardiology',
      'status': FilterStatus.complete,
    },
    {
      'doctor_name': 'James Oduour',
      'doctor_profile': 'assets/images/profile2.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Kali Linux',
      'doctor_profile': 'assets/images/profile4.png',
      'category': 'Respirations',
      'status': FilterStatus.cancel,
    },
    {
      'doctor_name': 'John Doe',
      'doctor_profile': 'assets/images/profile3.png',
      'category': 'Dermatology',
      'status': FilterStatus.complete,
    },
    {
      'doctor_name': 'Kingsley Chapin',
      'doctor_profile': 'assets/images/profile1.png',
      'category': 'Gynecology',
      'status': FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // return filtered appointments
    List<dynamic> filteredSchedules = schedules.where((schedule) {
      return schedule['status'] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Config.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: const TextStyle(
                                  color: Config.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 -
                        10, // Adjust width to fit each segment
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 216, 117),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Config.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Config.greyColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(_schedule['doctor_profile']),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctor_name'],
                                    style: const TextStyle(
                                      color: Config.blackColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['category'],
                                    style: const TextStyle(
                                      color: Config.greyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const ScheduleCard(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 123, 125, 125),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Config.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 68, 233, 255),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(
                                      color: Config.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Add a list or UI here to show filteredSchedules if necessary
          ],
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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            'Monday, 11,34,2022',
            style: TextStyle(
              color: Config.primaryColor,
            ),
          ),
          SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              '2.00 PM',
              style: TextStyle(
                color: Config.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
