import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final Function(String) onCategorySelected; // Declare the callback

  CategorySelector({required this.onCategorySelected});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String? categoryType;

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> categoryColors = {
      'Urban\nFlood': Theme.of(context).primaryColorLight,
      'Sewage\nBlockade': Theme.of(context).primaryColorLight,
      'Polluted\nPonds': Theme.of(context).primaryColorLight,
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...categoryColors.keys.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: categoryType == category
                        ? categoryColors[category]
                        : Color.fromARGB(255, 225, 230, 234),
                  ),
                  onPressed: () {
                    setState(() {
                      categoryType = category;
                      widget.onCategorySelected(
                          categoryType!); // Invoke the callback with the updated categoryType
                    });
                  },
                  child: Container(
                    // padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
        ],
      ),
    );
  }
}
