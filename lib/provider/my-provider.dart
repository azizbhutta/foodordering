import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodordering/models/food_categories_model.dart';
import '../models/cart_model.dart';
import '../models/categories_model.dart';
import '../models/foods_model.dart';

   class MyProvider extends ChangeNotifier{

     List<CategoriesModel> burgerList = [];
     late CategoriesModel burgerModel;
     Future<void> getBurgerCategory() async {
       List<CategoriesModel> newBurgerList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
           .collection('categories')
           .doc('fcZvdwpRLFbhsfUoSXTZ')
           .collection('burger')
           .get();
       querySnapshot.docs.forEach((element) {
         burgerModel = CategoriesModel(
           image: element ['image'],
           name: element ['name'],
         );
         newBurgerList.add(burgerModel);
         burgerList = newBurgerList;
       });
       notifyListeners();
     }
     get throwBurgerList {
       return burgerList;
     }

////////////// 2nd category ////////////
     List<CategoriesModel> recipeList = [];
     late CategoriesModel recipeModel;
     Future<void> getRecipeCategory() async {
       List<CategoriesModel> newRecipeList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
           .collection('categories')
           .doc('fcZvdwpRLFbhsfUoSXTZ')
           .collection('recipes')
           .get();
       querySnapshot.docs.forEach((element) {
         recipeModel = CategoriesModel(
           image: element ['image'],
           name: element ['name'],
         );
         newRecipeList.add(recipeModel);
         recipeList = newRecipeList;
       });
       notifyListeners();
     }

     get throwRecipeList {
       return recipeList;
     }

     ////////////////// 3rd category /////////////////
     List<CategoriesModel> pizzaList = [];
     CategoriesModel? pizzaModel;
     Future<void> getPizzaCategory() async {
       List<CategoriesModel> newPizzaList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
           .collection('categories')
           .doc('fcZvdwpRLFbhsfUoSXTZ')
           .collection('pizza')
           .get();
       querySnapshot.docs.forEach((element) {
         pizzaModel = CategoriesModel(
           image: element ['image'],
           name: element ['name'],
         );
         newPizzaList.add(pizzaModel!);
         pizzaList = newPizzaList;
       });
       notifyListeners();
     }

     get throwPizzaList {
       return pizzaList;
     }

///////////////// 4th category /////////////
     List<CategoriesModel> drinkList = [];
     late CategoriesModel drinkModel;
     Future<void> getDrinkCategory() async {
       List<CategoriesModel> newDrinkList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
           .collection('categories')
           .doc('fcZvdwpRLFbhsfUoSXTZ')
           .collection('drink')
           .get();
       querySnapshot.docs.forEach((element) {
         drinkModel = CategoriesModel(
           image: element ['image'],
           name: element ['name'],
         );
         newDrinkList.add(drinkModel);
         drinkList = newDrinkList;
       });
       notifyListeners();
     }

     get throwDrinkList {
       return drinkList;
     }

     /////////////// Singel Food Items /////////////

    List<FoodModel> foodModelList =[];
     FoodModel? foodModel;
     Future<void> getFoodList() async{
       List<FoodModel> newFoodModelList = [];
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('foods').get();
      querySnapshot.docs.forEach((element) {
        foodModel = FoodModel(
            name: element ['name'],
            image: element ['image'],
            price: element ['price'],
        );
        newFoodModelList.add(foodModel!);
      });
       foodModelList = newFoodModelList;
       notifyListeners();
     }
     get throwFoodModelList{
       return foodModelList;
     }

     ////////// Burger Categories ///////

    List<FoodCategoriesModel> bugerCatList = [];
     FoodCategoriesModel ? burgerCategoriesModel;
     Future<void> getBurgerCatList () async{
       List<FoodCategoriesModel> newburgerCatModelList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.
       collection('foodcategories')
           .doc('WBpdYd2GgmKXLUM04NPE')
           .collection('burger')
       .get();
       querySnapshot.docs.forEach((element) {
         burgerCategoriesModel = FoodCategoriesModel(
           image: element ['image'],
           name: element ['name'],
           price : element ['price']

         );
         newburgerCatModelList.add(burgerCategoriesModel!);
         bugerCatList = newburgerCatModelList;
       });
       // print(burgerCategoriesModel?.name);
     }
     get throwBugerCatList {
       return bugerCatList;
     }

     //////// Pizza Categories   ///////////

   List<FoodCategoriesModel> pizzaCatList = [];
     FoodCategoriesModel ? pizzaCategoriesModel;
     Future<void> getPizzaCatList ()async{
       List<FoodCategoriesModel> newpizzaCatModeList = [];
       QuerySnapshot querySnapshot =await FirebaseFirestore.instance.
       collection('foodcategories').doc('WBpdYd2GgmKXLUM04NPE').collection('pizza').get();
       querySnapshot.docs.forEach((element) {
         pizzaCategoriesModel = FoodCategoriesModel(name: element ['name'], price: element ['price'], image: element ['image']);
       newpizzaCatModeList.add(pizzaCategoriesModel!);
       pizzaCatList = newpizzaCatModeList;
       });
     }
     get throwPizzaCatList {
       return pizzaCatList;
     }

     /////////// Recepies Categories /////////

     List<FoodCategoriesModel> recepieCatList = [];
     FoodCategoriesModel ? recepieCategoriesModel;
     Future<void> getRecepieCatList () async{
       List<FoodCategoriesModel> newrecepieCatModelList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.
       collection('foodcategories')
           .doc('WBpdYd2GgmKXLUM04NPE')
           .collection('recipes')
           .get();
       querySnapshot.docs.forEach((element) {
         recepieCategoriesModel = FoodCategoriesModel(
             image: element ['image'],
             name: element ['name'],
             price : element ['price']

         );
         newrecepieCatModelList.add(recepieCategoriesModel!);
         recepieCatList = newrecepieCatModelList;
       });
       // print(recepieCategoriesModel?.name);
     }
     get throwrecepieCatList {
       return recepieCatList;
     }

     /////// Drink Categories //////////

   List<FoodCategoriesModel> drinkCatList =[];
     FoodCategoriesModel? drinkCategoriesModel;
     Future<void> getDrinkCatList ()async {
       List<FoodCategoriesModel> newdrinkCatModleList = [];
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.
       collection('foodcategories')
           .doc('WBpdYd2GgmKXLUM04NPE').collection('drink').get();
       querySnapshot.docs.forEach((element) {
         drinkCategoriesModel= FoodCategoriesModel(
             name: element ['name'],
             price: element ['price'],
             image: element ['image']
         );
         newdrinkCatModleList.add(drinkCategoriesModel!);
         drinkCatList = newdrinkCatModleList;

       });
     }
     get throwdrinkCatList {
       return drinkCatList;
     }

     ////// ADD TO CART   //////

   List<CartModel> cartList = [];
     List<CartModel> newCartList = [];
     CartModel? cartModel;
     void addToCart({required String name,
       required String image,
       required num price,
       required num quantity }){

       cartModel = CartModel(
           name: name,
           image: image,
           price: price,
           quantity: quantity);

       newCartList.add(cartModel!);
       cartList = newCartList;
     }
     get  throwCartList{
       return cartList;
     }

   }