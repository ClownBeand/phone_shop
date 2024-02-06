import 'package:electronics/components/mobile_tile.dart';
import 'package:electronics/pages/mobile_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Themes/hyper.dart';
import '../models/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate mobile item details page
  void navigateToMobileDetails(int index) {
    // get the shop and and it's menu
    final shop = context.read<Shop>();
    final mobileList = shop.mobileList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MobileDetailsPage(
          mobile: mobileList[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and and it's menu
    final shop = context.read<Shop>();
    final mobileList = shop.mobileList;

    return Scaffold(
      backgroundColor:backgroundColor,
      appBar: (AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Color(0xFF45A29E),
          size: 25,
        ),
        title: const Text(
          'New Vegas',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Color(0xFF45A29E),
              ))
        ],
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here...",
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          // popular mobile
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // image
                    Image.asset(
                      "assets/images/Mobile/iphone-13-Pro-Silver.png",
                      height: 70,
                      width: 70,
                    ),

                    const SizedBox(
                      width: 25,
                    ),

                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Iphone 13 pro",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        //price
                        Text(
                          "\$ 750",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),

                //heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 25,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Mobile Shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //menu list
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mobileList.length,
              itemBuilder: (context, index) => MobileTile(
                mobile: mobileList[index],
                onTap: () => navigateToMobileDetails(index),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
