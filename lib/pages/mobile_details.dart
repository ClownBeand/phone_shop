import 'package:electronics/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Themes/hyper.dart';
import '../models/Mobile.dart';
import '../models/shop.dart';

class MobileDetailsPage extends StatefulWidget {
  final Mobile mobile;
  const MobileDetailsPage({super.key, required this.mobile});

  @override
  State<MobileDetailsPage> createState() => _MobileDetailsPageState();
}

class _MobileDetailsPageState extends State<MobileDetailsPage> {
  

  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.mobile, quantityCount);
      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);

                // pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of mobile details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.mobile.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // rating
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // rating number
                      Text(
                        widget.mobile.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  // name mobile
                  Text(
                    widget.mobile.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 25),
                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "The Samsung Galaxy S10 is a line of Android-based smartphones manufactured, released and marketed by Samsung Electronics as part of the Samsung Galaxy S series. The Galaxy S10 series is the tenth generation of the Samsung Galaxy S, its flagship line of phones next to the Note models, which is also the 10th anniversary of the Galaxy S. Unveiled during the \"Samsung Galaxy Unpacked 2019\" press event held on 20 February 2019, the devices started shipping in certain regions such as Australia and the United States on 6 March 2019, then worldwide on 8 March 2019.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // price + quantity + add cart
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$ ${widget.mobile.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // quntity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () => decrementQuantity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // count quantity
                        SizedBox(
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // plus  button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () => incrementQuantity(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                
                //add cart
                MyButton(
                  text: "Add to Cart",
                  onTap: addToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
