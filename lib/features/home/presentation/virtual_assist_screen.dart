import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';
import 'package:sentra_health/features/detail_virtual_assist/presentation/bloodpressure_screen.dart';
import 'package:sentra_health/features/detail_virtual_assist/presentation/bodytemp_screen.dart';
import 'package:sentra_health/features/detail_virtual_assist/presentation/heartrate_screen.dart';
import 'package:sentra_health/features/detail_virtual_assist/presentation/respiratory_screen.dart';

class VirtualAssistScreen extends StatefulWidget {
  const VirtualAssistScreen({Key? key}) : super(key: key);

  @override
  _VirtualAssistScreenState createState() => _VirtualAssistScreenState();
}

class _VirtualAssistScreenState extends State<VirtualAssistScreen> {
  @override
  Widget build(BuildContext context) {
    List hari = [
      'Sen',
      'Sel',
      'Rab',
      'Kam',
      'Jum',
      'Sab',
      'Min',
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palletes.PrimaryColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Virtual Health Assist',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height * 0.1,
                  color: Palletes.PrimaryColor,
                ),
                Positioned(
                  bottom: -70,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3, 3),
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Palletes.PrimaryColor,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.watch,
                                color: Palletes.PrimaryColor,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '100%',
                                style: TextStyles.blackBoldFontStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.signal_cellular_alt,
                                        color: Palletes.PrimaryColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Telkomsel',
                                        style:
                                            TextStyles.titleBlackboldFontStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.wifi,
                                        color: Palletes.PrimaryColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'wificerdas',
                                        style:
                                            TextStyles.titleBlackboldFontStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'detail',
                                  style: TextStyles.normalFontStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 80,
              ),
              padding: EdgeInsets.all(
                20,
              ),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1 / 1.4,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeartRateScreen(),
                        ),
                      );
                    },
                    child: ParameterTubuh(
                      indicator: 'Detak Jantung',
                      iconIndicator: FontAwesomeIcons.heartbeat,
                      angkaIndicator: '102',
                      satuanIndicator: 'bpm',
                      keterangan: '🏃 Jangan lupa ber-olahraga',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BloodPressureScreen(),
                        ),
                      );
                    },
                    child: ParameterTubuh(
                      indicator: 'Tekanan Darah',
                      iconIndicator: FontAwesomeIcons.water,
                      angkaIndicator: '144\n/ 71',
                      satuanIndicator: 'mmhg',
                      keterangan: 'Tekanan darah anda normal 😴',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RespiratoryScreen(),
                        ),
                      );
                    },
                    child: ParameterTubuh(
                      indicator: 'SpO₂',
                      iconIndicator: Icons.bloodtype,
                      angkaIndicator: '98',
                      satuanIndicator: '%',
                      keterangan: 'Wow oxygen dalam darah anda bagus 👍',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BodyTempScreen(),
                        ),
                      );
                    },
                    child: ParameterTubuh(
                      indicator: 'Body Temperature',
                      iconIndicator: FontAwesomeIcons.thermometerHalf,
                      angkaIndicator: '78',
                      satuanIndicator: '°C',
                      keterangan: 'Suhu anda sedang normal, pertahankan !',
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              // TODO: Visualisasi Data Stress Level
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level Stress',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(hari.length, (index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        Palletes.PrimaryColor.withOpacity(0.5),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 80,
                                    width: 13,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Palletes.PrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              hari[index],
                              style: TextStyles.titleBlackboldFontStyle,
                            ),
                          ],
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Index Kesehatan Anda',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Sehat',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.green,
                          ),
                        ),
                        child: Text(
                          '98%',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Catatan :',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Hubungi Dokter konsultasi anda untuk memastikan keadaan anda sudah dalam kondisi Prima',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ParameterTubuh extends StatelessWidget {
  final String indicator;
  final IconData iconIndicator;
  final String angkaIndicator;
  final String satuanIndicator;
  final String keterangan;
  const ParameterTubuh({
    Key? key,
    required this.indicator,
    required this.iconIndicator,
    required this.angkaIndicator,
    required this.satuanIndicator,
    required this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 3),
            blurRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconIndicator,
                  size: 25,
                  color: Palletes.PrimaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  indicator,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            keterangan,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              height: 1.3,
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
                    fontSize: 28,
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
    );
  }
}
