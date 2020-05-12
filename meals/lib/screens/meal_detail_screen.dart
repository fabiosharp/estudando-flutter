import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {

  final void Function(Meal) onFavourite;
  final bool Function(Meal) isFavourite;

  const MealDetailScreen(this.onFavourite, this.isFavourite);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _createSectionContainer(Widget listviewChild) {
    return Container(
      width: 330,
      height: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: listviewChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            this._createSectionTitle(context, 'Ingredientes'),
            this._createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (contxt, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            this._createSectionTitle(context, 'Modo de Preparo'),
            this._createSectionContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (contxt, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    if (meal.steps.length - 1 != index) Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          onFavourite(meal);
        },
      ),
    );
  }
}
