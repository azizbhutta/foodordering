import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final num price;
  final Function() onTap;
    const BottomContainer({Key? key,required this.image, required this.price, required this.name, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: const Color(0xff3e3e3e),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(image.toString()),
            ),
            ListTile(
              leading: Text(
                name,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              trailing: Text(
                "\$ $price",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
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
