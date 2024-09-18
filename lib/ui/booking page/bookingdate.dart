// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/model.dart';

class BookingDate extends StatefulWidget {
  const BookingDate({super.key});

  @override
  State<BookingDate> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  DateTime? tanggal;
  String? tgl;
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Chosse Booking Date",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          DatePicker(
            maxDate: DateTime(2030),
            minDate: DateTime(2024),
            onDateSelected: (value) {
              setState(() {
                print(value.toString().substring(0, 11));
                tanggal = value;
                tgl = value.toString().substring(0, 11);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: lebar * 0.4,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, 'detail'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    elevation: MaterialStateProperty.all<double>(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                width: lebar * 0.4,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, '/detailbooking',
                      arguments: {
                        "id": data["id"],
                        "harga": data["harga"],
                        "tanggal": tgl,
                      }),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffFCD240)),
                  ),
                  child: Text(
                    "Confrim",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
