// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
    this.desc,
    this.harga,
    this.rating,
    this.tempat,
    this.img,
  }) : super(key: key);

  final String? tempat;
  final String? img;
  final String? desc;
  final num? rating;
  final int? harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              img.toString(),
              height: 130, // Set tinggi gambar sesuai kebutuhan Anda
              width: 110, // Set lebar gambar sesuai kebutuhan Anda
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        '$tempat',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
                Text(
                  'Rp $harga',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star),
                    const Icon(Icons.star),
                    const Icon(Icons.star),
                    Text('$rating'),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: Text(
                    '$desc',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600),
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
