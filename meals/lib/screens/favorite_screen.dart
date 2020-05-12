import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> meals;

  FavoriteScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    if (this.meals.isEmpty)
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );

    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (contxt, index) {
        return MealItem(meals[index]);
      },
    );
  }
}
