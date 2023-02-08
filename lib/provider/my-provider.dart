import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
   }