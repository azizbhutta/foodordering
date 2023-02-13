import 'package:flutter/material.dart';
import 'package:foodordering/Widget/bottom_container.dart';
import 'package:foodordering/models/categories_model.dart';
import 'package:foodordering/provider/my-provider.dart';
import 'package:foodordering/screen/detail_page.dart';
import 'package:provider/provider.dart';
import '../models/foods_model.dart';
import 'categories.dart';
import '../models/food_categories_model.dart';

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
  List<FoodCategoriesModel> bugerCatList = [];
  List<FoodCategoriesModel> pizzaCatList = [];
  List<FoodCategoriesModel> recipesCatList = [];
  List<FoodCategoriesModel> drinkCatList = [];

  Widget categoriesContainer({
    required Function() onTap,
    required String image,
    required String name,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image.toString())),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
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


  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        name,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget pizza() {
    // print("Razi $pizzaList");
    return Row(
      children: pizzaList
          .map((e) => categoriesContainer(image: e.image, name: e.name, onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Categories(list: pizzaCatList)));
      }))
          .toList(),
    );
  }

  Widget Burger() {
    // print("Razi $pizzaList");
    return Row(
      children: burgerList
          .map((e) => categoriesContainer(image: e.image, name: e.name, onTap: (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Categories(
              list: bugerCatList,
            ),
          ),
        );
      }))
          .toList(),
    );
  }

  Widget recepies() {
    // print("Razi $pizzaList");
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(image: e.image, name: e.name, onTap: (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Categories(
              list: recipesCatList,
            ),
          ),
        );
      }))
          .toList(),
    );
  }

  Widget drink() {
    // print("Razi $pizzaList");
    return Row(
      children: drinkList
          .map((e) => categoriesContainer(image: e.image, name: e.name, onTap: (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Categories(
              list: drinkCatList,
            ),
          ),
        );
      }))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;

    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;

    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;

    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;

    // TODO Single food list
    provider.getFoodList();
    singelFoodList = provider.throwFoodModelList;

    // TODO Bureger Categories
    provider.getBurgerCatList();
    bugerCatList = provider.throwBugerCatList;

    //TODO Pizza Categories
    provider.getPizzaCatList();
    pizzaCatList = provider.throwPizzaCatList;

    //TODO Recipes Categories
    provider.getRecepieCatList();
    recipesCatList = provider.throwrecepieCatList;

    //TODO Drink Categories
    provider.getDrinkCatList();
    drinkCatList = provider.throwdrinkCatList;


    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/background.jpg'))),
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
                  leading: Text(
                    'Communicate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
                  children: singelFoodList
                      .map(
                        (e) => BottomContainer(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  DetailScreen(
                                image: e.image,
                                name: e.name,
                                price: e.price,
                            )));
                          },
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      )
                      .toList())
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
