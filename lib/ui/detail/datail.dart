import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/model.dart';

class Detail extends StatefulWidget {
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments
        as WisataList; //ambil data dari arguments
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: tinggi,
            width: lebar,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data.gambarWisata), fit: BoxFit.cover)),
          ),
          Container(
            height: tinggi,
            width: lebar,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black38],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false),
                          icon: Icon(
                            Icons.arrow_left,
                            color: Colors.white,
                            size: 25,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Favorit Place',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.namaWisata,
                        style: GoogleFonts.poppins(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            data.lokasiWisata,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          'Dolore est excepteur laborum veniam qui pariatur exercitation reprehenderit do velit velit nisi. Enim in in nulla minim ea aliquip. Id magna sunt occaecat officia. Enim cillum ullamco aliquip anim amet ex occaecat occaecat. Ad proident consectetur esse laboris ipsum tempor do duis aliquip est.',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Wrap(
                          spacing: 5,
                          children: [
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 252, 210, 64),
                                size: 20),
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 252, 210, 64),
                                size: 20),
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 252, 210, 64),
                                size: 20),
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 252, 210, 64),
                                size: 20),
                            Icon(Icons.star, color: Colors.white, size: 20),
                            Text(data.ratingWisata.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white))),
                            SizedBox(width: 300),
                            Text(
                              'Rp 1000', // String harga
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                            ),
                            Container(
                              width: lebar,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                onPressed: () => Navigator.pushNamed(
                                    context, "/booking", arguments: {
                                  "id": data.id,
                                  "harga": data.hargaWisata
                                }),
                                child: Text(
                                  'Booking',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
