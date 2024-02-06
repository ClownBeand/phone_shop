import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../models/Mobile.dart';

class MobileTile extends StatelessWidget {
  final Mobile mobile;
  final void Function()? onTap;

  const MobileTile({
    super.key,
    required this.mobile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 25),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Image.asset(
              mobile.imagePath,
              height: 140,
            ),
            // text
            Text(
              mobile.name,
              style: GoogleFonts.dmSerifDisplay(),
            ),
            // price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    "\$ " + mobile.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  //rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Text(
                        mobile.rating,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
