import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isEmpty) {
      // kalau meals kosong
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No Foods",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Try selecting different category",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
            )
          ],
        ),
      );
    } else {
      // kalau meals ada isinya
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return ListTile(
            leading: Image.network(meal.imageUrl, width: 50, fit: BoxFit.cover),
            title: Text(meal.title),
            subtitle: Text('${meal.duration} min'),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("$title (${meals.length})"),
      ),
      body: content,
    );
  }
}