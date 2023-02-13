import 'package:flutter/material.dart';
import 'package:foodordering/screen/detail_page.dart';
import 'package:foodordering/screen/home_page.dart';
import '../Widget/bottom_container.dart';
import '../models/food_categories_model.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModel> list = [];

   Categories({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () { 
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
        },),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map(
                (e) => BottomContainer(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DetailScreen(
                        image: e.image,
                        name: e.name,
                        price: e.price,)));
                  },
              image: e.image,
              price: e.price,
              name: e.name,
            ),
          )
              .toList()),
    );
  }
}
