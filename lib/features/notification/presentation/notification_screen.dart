import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 0,
        title: Text(
          'Notifikasi',
          style: GoogleFonts.montserrat(
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              right: 20,
            ),
            child: Text(
              'Tandai Semua telah dibaca',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _containerNotifikasi(size),
            _containerNotifikasi(size),
            _containerNotifikasi(size),
            _containerNotifikasi(size),
          ],
        ),
      ),
    );
  }

  _containerNotifikasi(size) {
    return Container(
      color: Palletes.PrimaryColor.withOpacity(0.1),
      width: size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Info',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
              Text(
                ' • ',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                ),
              ),
              Text(
                '07 Agu 2021',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Kondisi badan anda prima!',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Hari ini anda tidur 8 Jam pada malam hari, dan itu baik bagi tubuh anda. Pertahankan habit anda untuk menjaga kondisi badan tetap fit!',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
