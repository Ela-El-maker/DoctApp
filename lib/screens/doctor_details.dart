import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/button.dart';
import '../components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AboutDoctor(),
            Config.spaceSmall,
            const DetailsBody(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                disable: false,
                onPressed: () {
                  Navigator.of(context).pushNamed('bookingPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Column(
      children: <Widget>[
        const CircleAvatar(
          radius: 65.0,
          backgroundImage: AssetImage('assets/images/profile2.png'),
          backgroundColor: Colors.white,
        ),
        Config.spaceMedium,
        const Text(
          'Dr. Richard Hendricks',
          style: TextStyle(
            color: Config.blackColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.75,
          child: const Text(
            'MBBS (International Medical University, Madagascar), MRCP (Royal College of Physicians, Rwanda)',
            style: TextStyle(
              color: Config.greyColor,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.75,
          child: const Text(
            'Madagascar General Hospital',
            style: TextStyle(
              color: Config.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           DoctorInfo(),
          Config.spaceSmall,
           Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Config.spaceSmall,
           Text(
            'Dr. Richard is an experienced Cardiologist in Silicon Valley. He is a graduate since 2000, and completed his training at Sinai Mental Hospital.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align items evenly
      children:  <Widget>[
        InfoCard(label: 'Patients', value: '200'),
        SizedBox(width: 10,),
        InfoCard(label: 'Experience', value: '10 years'),
        SizedBox(width: 10,),
        InfoCard(label: 'Rating', value: '4.5'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20, // Adjusted padding for better spacing
          horizontal: 10,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Config.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Config.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
