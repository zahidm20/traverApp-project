import 'package:flutter/material.dart';

class JudulWidget extends StatelessWidget {
  const JudulWidget({
    super.key,
    required this.judul,
    required this.onPressed,
    required this.link,
  });

  final String judul;
  final String link;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          judul,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            link,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
