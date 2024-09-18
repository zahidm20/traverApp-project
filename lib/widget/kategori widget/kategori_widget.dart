import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriWidget extends StatelessWidget {
  const KategoriWidget({super.key, required this.name, required this.img});

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(img)),
            const SizedBox(width: 5),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
