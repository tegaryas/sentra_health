import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';

class VirtualAssistScreen extends StatefulWidget {
  const VirtualAssistScreen({Key? key}) : super(key: key);

  @override
  _VirtualAssistScreenState createState() => _VirtualAssistScreenState();
}

class _VirtualAssistScreenState extends State<VirtualAssistScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                                      style: TextStyles.titleBlackboldFontStyle,
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
                                      style: TextStyles.titleBlackboldFontStyle,
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
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1 / 1.3,
              children: [
                Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(
                    20,
                  ),
                ),
                Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(
                    20,
                  ),
                ),
                Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(
                    20,
                  ),
                ),
                Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(
                    20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
