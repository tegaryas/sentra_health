import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';
import 'package:sentra_health/features/home/presentation/konsultasi_dokter_screen.dart';
import 'package:sentra_health/features/home/presentation/virtual_assist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '👋 Hello,',
                            style: GoogleFonts.montserrat(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            'Tegar Yasindra',
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Palletes.PrimaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParameterTubuh(
                          indicator: 'Detak Jantung',
                          iconIndicator: FontAwesomeIcons.heartbeat,
                          angkaIndicator: 102,
                          satuanIndicator: 'bpm',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ParameterTubuh(
                          indicator: 'Waktu Tidur',
                          iconIndicator: CupertinoIcons.alarm_fill,
                          angkaIndicator: 2,
                          satuanIndicator: 'Jam',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParameterTubuh(
                          indicator: 'SpO₂',
                          iconIndicator: Icons.bloodtype,
                          angkaIndicator: 98,
                          satuanIndicator: '%',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ParameterTubuh(
                          indicator: 'Body Temperature',
                          iconIndicator: FontAwesomeIcons.thermometerHalf,
                          angkaIndicator: 78,
                          satuanIndicator: '°C',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              _headerKategori('Layanan Cepat'),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.1,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [
                  ListLayanan(
                    titleLayanan: 'Konsultasi Dokter',
                    imageUrl: 'assets/icons/doctor.png',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KonsultasiDokterScreen(),
                        ),
                      );
                    },
                  ),
                  ListLayanan(
                    titleLayanan: 'Rumah Sakit & Klinik',
                    imageUrl: 'assets/icons/ambulance.png',
                    onPress: () {},
                  ),
                  ListLayanan(
                    titleLayanan: 'Virtual Health Assist',
                    imageUrl: 'assets/icons/emergency-call.png',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VirtualAssistScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _headerKategori('Artikel Terkini'),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 180,
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Palletes.PrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Benar kah meminum air kelapa dapat menyebabakan ginjal?',
                              style: TextStyles.blackBoldFontStyle,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Ginjal',
                                style: TextStyles.normalFontStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 180,
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Palletes.PrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Benar kah meminum air kelapa dapat menyebabakan ginjal?',
                              style: TextStyles.blackBoldFontStyle,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Ginjal',
                                style: TextStyles.normalFontStyle,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _headerKategori(String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ListLayanan extends StatelessWidget {
  final VoidCallback onPress;
  final String titleLayanan;
  final String imageUrl;
  const ListLayanan({
    Key? key,
    required this.titleLayanan,
    required this.imageUrl,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(
                20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageUrl,
                    scale: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              titleLayanan,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ParameterTubuh extends StatelessWidget {
  final String indicator;
  final IconData iconIndicator;
  final int angkaIndicator;
  final String satuanIndicator;
  const ParameterTubuh({
    Key? key,
    required this.indicator,
    required this.iconIndicator,
    required this.angkaIndicator,
    required this.satuanIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    iconIndicator,
                    color: Palletes.PrimaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    indicator,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    '$angkaIndicator',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Palletes.PrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    satuanIndicator,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
