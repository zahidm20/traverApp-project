// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FavoriteWisataWidget extends StatefulWidget {
  FavoriteWisataWidget({
    super.key,
    this.tempat,
    this.rating,
    this.img,
    this.nama,
  });

  String? nama;
  String? img;
  String? tempat;
  num? rating;

  @override
  State<FavoriteWisataWidget> createState() => _FavoriteWisataWidgetState();
}

class _FavoriteWisataWidgetState extends State<FavoriteWisataWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${widget.img}'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    icon: Icon(Icons.favorite,
                        color: isFav ? Colors.red : Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.nama}',
                    style: const TextStyle(color: Colors.white)),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        '${widget.tempat}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    Text(
                      '${widget.rating}',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
