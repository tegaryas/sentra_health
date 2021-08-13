import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';

class KonsultasiDokterScreen extends StatefulWidget {
  const KonsultasiDokterScreen({Key? key}) : super(key: key);

  @override
  _KonsultasiDokterScreenState createState() => _KonsultasiDokterScreenState();
}

class _KonsultasiDokterScreenState extends State<KonsultasiDokterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
            color: Palletes.PrimaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Konsultasi Dokter',
          style: GoogleFonts.montserrat(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _searchBar(),
            ListDokter(),
            ListDokter(),
            ListDokter(),
          ],
        ),
      ),
    );
  }

  _searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Palletes.PrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cari Dokter...',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Palletes.PrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ListDokter extends StatelessWidget {
  const ListDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Aulya Dini',
                      style: DokterTextStyles.namaDokterFontStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Dokter Umum',
                      style: DokterTextStyles.jabatanDokterFontStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 4.5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.5',
                          style: DokterTextStyles.ratingDokterFontStyle,
                        ),
                        Container(
                          height: 12,
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        Text(
                          '177 Ulasan',
                          style: DokterTextStyles.ratingDokterFontStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_rounded,
                color: Palletes.PrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
