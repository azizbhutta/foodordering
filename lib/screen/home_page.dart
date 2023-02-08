import 'package:flutter/material.dart';
import 'package:foodordering/models/categories_model.dart';
import 'package:foodordering/provider/my-provider.dart';
import 'package:provider/provider.dart';

import '../models/foods_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<CategoriesModel> pizzaList = [];
  List<CategoriesModel> burgerList = [];
  List<CategoriesModel> recipeList = [];
  List<CategoriesModel> drinkList = [];
  List<FoodModel> singelFoodList = [];


  Widget categoriesContainer({
    required String image,
    required String name,
  }) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image.toString())),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Widget bottonContainer(
      {required String image, required num price, required String name}) {
    return Container(
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
            trailing:   Text(
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
    );
  }

  Widget drawerItem ({required String name , required IconData icon}){
   return  ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(name,style:  const TextStyle(fontSize: 18 , color: Colors.white),),
    );
  }

  Widget pizza(){
    // print("Razi $pizzaList");
  return Row(
    children: pizzaList.map((e) => categoriesContainer(image: e.image, name: e.name)).toList(),
  );
  }

  Widget Burger(){
    // print("Razi $pizzaList");
    return Row(
      children: burgerList.map((e) => categoriesContainer(image: e.image, name: e.name)).toList(),
    );
  }

  Widget recepies(){
    // print("Razi $pizzaList");
    return Row(
      children: recipeList.map((e) => categoriesContainer(image: e.image, name: e.name)).toList(),
    );
  }

  Widget drink(){
    // print("Razi $pizzaList");
    return Row(
      children: drinkList.map((e) => categoriesContainer(image: e.image, name: e.name)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider= Provider.of<MyProvider>(context);

    provider.getPizzaCategory();
    pizzaList =provider.throwPizzaList;

    provider.getBurgerCategory();
    burgerList =provider.throwBurgerList;

    provider.getRecipeCategory();
    recipeList =provider.throwRecipeList;

    provider.getDrinkCategory();
    drinkList =provider.throwDrinkList;

    // TODO Single food list

    provider.getFoodList();
    singelFoodList =provider.throwFoodModelList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/background.jpg'))
                  ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    accountName: Text('Aziz Bhutta'),
                    accountEmail: Text('azizbhutta@gmail.com'),
                ),
                drawerItem(name: 'Profile', icon: Icons.person),
                drawerItem(name: 'Cart', icon: Icons.add_shopping_cart),
                drawerItem(name: 'Order', icon: Icons.shop),
                drawerItem(name: 'About', icon: Icons.sim_card_alert_rounded),
                const Divider(
                  thickness: 1.0,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Text('Communicate', style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                drawerItem(name: 'Change', icon: Icons.lock),
                drawerItem(name: 'LogOut', icon: Icons.logout),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: const Color(0xff3e3e3e),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                pizza(),
                Burger(),
                recepies(),
                drink(),
                // catagoriesContainer(image: 'assets/images/1.png', name: 'All'),
                // catagoriesContainer(
                //     image: 'assets/images/2.png', name: 'Burger'),
                // catagoriesContainer(
                //     image: 'assets/images/3.png', name: 'Recipes'),
                // catagoriesContainer(
                //     image: 'assets/images/4.png', name: 'Pizza'),
                // catagoriesContainer(
                //     image: 'assets/images/5.png', name: 'Drink'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 510,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: singelFoodList.map((e) => bottonContainer(
                  image: e.image,
                  price: e.price,
                  name: e.name,
                ),
              ).toList()
                )
              // children: [
              //   bottonContainer(
              //       image: 'assets/images/4.png', price: 20, name: 'Burger'),
              //   bottonContainer(
              //       image: 'assets/images/5.png', price: 40, name: 'Pizza'),
              //   bottonContainer(
              //       image: 'assets/images/6.png', price: 60, name: 'Drink'),
              //   bottonContainer(
              //       image: 'assets/images/7.png', price: 80, name: 'Recipes')
              // ],
            ),

        ],
      ),
    );
  }
}
