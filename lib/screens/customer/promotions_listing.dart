// lib/screens/customer/promotions_listing.dart

import 'package:flutter/material.dart';

class PromotionsListing extends StatefulWidget {
  const PromotionsListing({super.key});

  @override
  PromotionsListingState createState() => PromotionsListingState();
}

class PromotionsListingState extends State<PromotionsListing> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions Listing'),
      ),
      body: Center(
        child: Placeholder(), // Use Placeholder for now
      ),
    );
  }
}