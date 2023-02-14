import 'package:flutter/material.dart';
import 'package:foodordering/screen/home_page.dart';
import 'package:provider/provider.dart';
import '../provider/my-provider.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required num price,
    required Function() onTap,
    required num quantity,
  }) {
    return Row(
      children: [
         Container(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "burger bhout acha hain",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "\$ $price",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "$quantity",
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: onTap,
                )
              ],
            )),
      ],
    );
  }
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
     num total = provider.totalprice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            color: const Color(0xff3a3e3e), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              "\$ $total",
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const Text(
              "Check Out",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
           provider.getDeleteIndex(index);
          return cartItem(
            onTap: (){
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 70,
//         margin: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
//         padding: const EdgeInsets.symmetric(horizontal: 10 ),
//         decoration: BoxDecoration(
//           color: const Color(0xff3a3e3e),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Text('\$23', style:  TextStyle(color: Colors.white, fontSize: 25),),
//             Text('Check out', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         leading: IconButton(icon: const Icon(Icons.arrow_back),
//           onPressed: (){
//         },),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: Container(
//                     width: 170,
//                     height: 170,
//                     child: const CircleAvatar(
//                       backgroundImage: AssetImage("assets/images/2.png"),
//                     ),
//                   )
//               ),
//               Expanded(
//                   child: Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Container(
//                         height: 200,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Pizza',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
//                             const Text('Its teasty and customer demand', style: TextStyle(color: Colors.white,fontSize: 20,),),
//                             const Text('\$23',style: TextStyle(color: Colors.white,fontSize: 30),),
//                             Row(
//                               children: [
//                                 IconButton(
//                                     onPressed: (){},
//                                     icon: const Icon(Icons.remove_circle_outline,color: Colors.white,size: 30,)),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Text('1',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 IconButton(onPressed: (){},
//                                     icon: const Icon(Icons.add_circle_outline,color: Colors.white,size: 30,))
//
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: (){
//                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
//                           },
//                           icon: const Icon(Icons.close,color: Colors.white,))
//                     ],
//                   )
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
