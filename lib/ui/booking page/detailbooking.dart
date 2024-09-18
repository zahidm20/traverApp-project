// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  var selectedValue;
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  TextEditingController nama = TextEditingController(),
      kontak = TextEditingController(),
      jumlah = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    var poppinsText = GoogleFonts.poppins;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Detail Booking',
                          style: poppinsText(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 1,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: nama,
                    decoration: InputDecoration(
                        // hintText: "Nama",
                        label: Text('Nama'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: kontak,
                    decoration: InputDecoration(
                        // hintText: "Kontak",
                        label: Text('Kontak'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: DropdownButtonFormField<int>(
                    value: selectedValue,
                    decoration: InputDecoration(
                      labelText: 'Jumlah',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    items: List.generate(20, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      );
                    }),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: tinggi * 0.06,
                  width: lebar * 0.42,
                  child: RichText(
                    text: TextSpan(
                      text: 'Total ',
                      style: poppinsText(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                // formatter.format(selectedValue * data['harga'].toString()),
                                selectedValue != null
                                    ? formatter
                                        .format(selectedValue! * data['harga'])
                                    : '0',
                            style: poppinsText(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.orange)),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
                Container(
                  height: tinggi * 0.06,
                  width: lebar * 0.42,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/payment', arguments: {
                      "id": data["id"],
                      "harga": data["harga"],
                      "tanggal": data["tanggal"],
                      "total": selectedValue! * data['harga'],
                      "nama": nama.text,
                      "kontak": kontak.text,
                      "jumlah": selectedValue
                    }),
                    child: Text(
                      'Payment Method',
                      style: poppinsText(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Color.fromARGB(255, 252, 211, 64))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
