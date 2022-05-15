import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final Function(String) getCategory;
  final bool isSelected;

  const CategoryButton(
      {Key? key, required this.text, required this.getCategory, required this.isSelected})
      : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  late bool isSelected;
  
  @override
  Widget build(BuildContext context) {
    isSelected = widget.isSelected;
    return TextButton(
        onPressed: () {
          setState(() {
            widget.getCategory(widget.text);
          });
        },
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (isSelected) {
              return Colors.white;
            }
            return Colors.black;
          },
        ), backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (isSelected) {
              return Colors.blue;
            }
            return Colors.grey[300];
          },
        )),
        child: Text(widget.text));
  }
}
