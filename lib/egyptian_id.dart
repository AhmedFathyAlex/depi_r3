import 'package:flutter/material.dart';

class EgyptianId extends StatelessWidget {
  /// This Widget help you create egyptian IDs
  EgyptianId({
    super.key,
    this.firstName = '',
    this.lastName = '',
    this.imageUr =
        'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small_2x/default-avatar-photo-placeholder-profile-icon-vector.jpg',
    this.address = '',
    this.city = '',
    this.id = '',
  });

  final String firstName;
  final String lastName;
  final String address;
  final String city;
  final String imageUr;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xffB7C7EF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.network(
              'https://lp-cms-production.imgix.net/2020-11/shutterstockRF_1456340747.jpg?auto=format,compress&q=72&fit=crop',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Image.network(
              imageUr,
              width: 60,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Text(firstName),
                Text(lastName),
                Text(address),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(city),
                ),
              ],
            ),
          ),
          Positioned(bottom: 10, right: 10, child: Text(id)),
        ],
      ),
    );
  }
}
