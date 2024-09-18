// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, unused_element

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/controller/payment_controller.dart';
import 'package:travel_app/controller/succes_controller.dart';
import 'package:travel_app/model/model.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool loading = false;
  int? selectedIndex;

  Widget Option(
    int Index,
    String ImageUrl,
    String Title,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = Index;
          print(Index);
          print(selectedIndex);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: selectedIndex == Index
                    ? Colors.greenAccent
                    : Color(0xffd9deea)),
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                ImageUrl,
                height: 45,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  Title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color(0xff191919),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: selectedIndex == Index
                  ? Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Icon(
                          Icons.done,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  saveBooking(
      String date_booking,
      String id_wisata,
      String name_booking,
      String contact_booking,
      int qty_booking,
      bool status_booking,
      int id_payment) {
    setState(() {
      loading = true;
    });

    var dt = SuccsesController()
        .SuccsesProses(date_booking, id_wisata, name_booking, contact_booking,
            qty_booking, status_booking, id_payment)
        .then((value) {
      if (value != null) {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Booking Berhasil",
          dialogType: DialogType.success,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
              context, "/succes", (route) => false),
        ).show();
      } else {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Booking Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

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
                    IconButton(
                      onPressed: () => Navigator.pop(context, '/detailbooking'),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Payments Method",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    FutureBuilder(
                      future: PaymentController().getPayment(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<DataPayment> data = snapshot.data;
                          return Container(
                              margin: EdgeInsets.only(bottom: tinggi * 0.03),
                              child: Wrap(
                                runSpacing: 30,
                                children: List.generate(data.length, (index) {
                                  return Option(
                                      data[index].id,
                                      data[index].gambarPayment,
                                      data[index].namePayment);
                                }),
                              ));
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: lebar * 0.4,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Total: ${data["payment"]}",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: lebar * 0.4,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      print(data["tanggal"]);
                      print(data["id"].toString());
                      print(data["nama"]);
                      print(data["kontak"]);
                      print(data["jumlah"]);
                      print(false);
                      print(selectedIndex!);

                      saveBooking(
                          data["tanggal"],
                          data["id"].toString(),
                          data["nama"],
                          data["kontak"],
                          data["jumlah"],
                          false,
                          selectedIndex!);
                    },
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}