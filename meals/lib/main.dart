import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _filteredMeals(Settings settings) {
    setState(() {
      this._availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavourite(Meal meal){
    setState(() {
      if (_favouriteMeals.contains(meal))
        _favouriteMeals.remove(meal);
      else
        _favouriteMeals.add(meal);
    });
  }

  bool _isFavourite(Meal meal){
    return _favouriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (contxt) => TabsScreen(_favouriteMeals),
        AppRoutes.CATEGORIES_MEALS: (contxt) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (contxt) => MealDetailScreen(_toggleFavourite, _isFavourite),
        AppRoutes.SETTINGS: (contxt) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filteredMeals,
            ),
      },
      onUnknownRoute: (settings) {
        // Error #404
        return MaterialPageRoute(builder: (_) {
          print('Error ' + settings.name);
          return CategoriesScreen();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
