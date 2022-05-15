import 'package:flutter/material.dart';
import 'package:nyt_popular_articles/Components/CategoryButton.dart';

class CategorySelector extends StatefulWidget {
  final Function(String) selectCategory;
  final int selectedButton = 0;
  const CategorySelector({Key? key, required this.selectCategory})
      : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedButton;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 35;
    const double buttonWidth = 75;
    const double buttonMargin = 10;

    List<Container> createButtons(selectedButtonIndex) {
      return [
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Home",
            getCategory: (text) {
              setState(() {
                selectedIndex = 0;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 0 ? true : false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Business",
            getCategory: (text) {
              setState(() {
                selectedIndex = 1;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 1 ? true : false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Books",
            getCategory: (text) {
              setState(() {
                selectedIndex = 3;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 3 ? true : false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Science",
            getCategory: (text) {
              setState(() {
                selectedIndex = 4;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 4 ? true : false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Sports",
            getCategory: (text) {
              setState(() {
                selectedIndex = 5;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 5 ? true : false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:buttonMargin, right:buttonMargin),
          width: buttonWidth,
          child: CategoryButton(
            text: "Politics",
            getCategory: (text) {
              setState(() {
                selectedIndex = 6;
                widget.selectCategory(text);
              });
            },
            isSelected: selectedIndex == 6 ? true : false,
          ),
        ),
      ];
    }

    List<Container> buttonList = createButtons(selectedIndex);

    return SizedBox(
      height: buttonHeight,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: buttonList,
      ),
    );
  }
}
