import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sentra_health/constants/styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailDokterScreen extends StatefulWidget {
  const DetailDokterScreen({Key? key}) : super(key: key);

  @override
  _DetailDokterScreenState createState() => _DetailDokterScreenState();
}

class _DetailDokterScreenState extends State<DetailDokterScreen> {
  @override
  void initState() {
    initializeDateFormatting();

    super.initState();
  }

  Widget build(BuildContext context) {
    String _selectedDate =
        DateFormat.yMMM('id').format(DateTime.now()).toString();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.35,
              width: size.width,
              decoration: BoxDecoration(
                color: Palletes.PrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/dokter.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dr. Viola Dunn',
                    style: DokterTextStyles.namaDokterDetailFontStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Therapist',
                    style: DokterTextStyles.jabatanDokterDetailFontStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 43,
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: size.height * 0.32),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleDetail('Tentang Dokter'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Dr. Viola Dunn's is an experienced specialist who is contantly working on improving her skills",
                    style: DokterTextStyles.detailDokterFontStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _titleDetail('Ulasan'),
                  SizedBox(
                    height: 15,
                  ),
                  ListReviews(),
                  SizedBox(
                    height: 20,
                  ),
                  _titleDetail('Lokasi'),
                  SizedBox(
                    height: 15,
                  ),
                  LokasiDokter(),
                  SizedBox(
                    height: 30,
                  ),
                  _titleDetailJadwal('Jadwal', _selectedDate),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          10,
                          (index) {
                            // TODO: Disni juga butuh state itu buat atur pemilihan
                            return ListJadwalHari();
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 40,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      // TODO: Butuh dibuat state nya
                      _listJadwalWaktu('09 : 00 AM'),
                      _listJadwalWaktu('10 : 00 AM'),
                      _listJadwalWaktu('11 : 00 AM'),
                      _listJadwalWaktu('01 : 30 PM'),
                      _listJadwalWaktu('02 : 30 PM'),
                      _listJadwalWaktu('04 : 00 PM'),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(size: size),
    );
  }

  _listJadwalWaktu(String waktu) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Palletes.PrimaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          waktu,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _titleDetail(String title) {
    return Text(
      title,
      style: DokterTextStyles.aboutDokterFontStyle,
    );
  }

  _titleDetailJadwal(String title, String _selectedDate) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
        ),
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          height: 450,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Palletes.PrimaryColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // TODO: Month Picker disinui daf tolonng ya
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Palletes.PrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Pilih Bulan',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: DokterTextStyles.aboutDokterFontStyle,
            ),
            Row(
              children: [
                Text(
                  '$_selectedDate',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            color: Colors.grey.shade200,
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Harga Konsultasi',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Rp. 526.812',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: BuildDialogDokter(),
                  );
                },
              );
            },
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Palletes.PrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Buat Janji',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildDialogDokter extends StatelessWidget {
  const BuildDialogDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.checkCircle,
            size: 60,
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Konfimasi',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Janji anda dengan Dr.Viola Dunn telah terkonfirmasi',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking ID',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
              ),
              Text(
                '#A8WU82187',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
              ),
              Text(
                'Senin, 15 Agustus 2021',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Waktu',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
              ),
              Text(
                '12 : 00 AM',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Palletes.PrimaryColor,
                    border: Border.all(
                      color: Palletes.PrimaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Bayar',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ListJadwalHari extends StatelessWidget {
  const ListJadwalHari({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Palletes.PrimaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'Senin',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '20',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class ListReviews extends StatelessWidget {
  const ListReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palletes.PrimaryColor.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Palletes.PrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joana Perkins',
                          style: DokterTextStyles.namaDokterFontStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1 Hari lalu',
                          style: DokterTextStyles.jabatanDokterFontStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange.shade300,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '5.0',
                      style: DokterTextStyles.ratingDokterFontStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Many thanks to Dr. Dunn, She is professional, competent doctor anda i like this kind of docter',
            style: DokterTextStyles.detailDokterFontStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class LokasiDokter extends StatelessWidget {
  const LokasiDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palletes.PrimaryColor.withOpacity(0.3),
            ),
            child: Icon(
              Icons.location_on,
              color: Palletes.PrimaryColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rumah Sakit Abdul Wahab Sjahranie',
                  style: DokterTextStyles.namaDokterFontStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Jl. Palang Merah No.1, Sidodadi, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur 75123',
                  style: DokterTextStyles.detailDokterFontStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
