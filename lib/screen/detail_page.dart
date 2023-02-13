import 'package:flutter/material.dart';
import 'package:foodordering/provider/my-provider.dart';
import 'package:foodordering/screen/home_page.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final num price;
  const DetailScreen({Key? key, required this.image, required this.name, required this.price,}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  num quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:  CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(widget.image.toString()),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff3a3e3e),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Text(
                    widget.name,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const Text(
                    'Spicy',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState((){
                                if (quantity > 1) quantity -- ;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Text(
                            '$quantity',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                quantity ++ ;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                       Text(
                        '\$ ${widget.price * quantity}',
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Text(
                    'Descriptions',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  ),
                  const Text(
                      'As previously said, pizza has evolved into a convenience meal rather than a delicacy. People agree that a slice of smoky, delectable pizza will improve their mood. It would be very helpful for you if you are one of those restaurants that makes the most incredible pizzas.'
                  ,style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        provider.addToCart(
                            name: widget.name,
                            image: widget.image,
                            price: widget.price,
                            quantity: quantity);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                            builder: (context) => CartScreen(),
                            ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary:Color(0xff2b2b2b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                        Icon(Icons.shopping_cart,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Add to Cart', style: TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
