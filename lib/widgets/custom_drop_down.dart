import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropDown(
      {super.key,
      required this.selectedValue,
      required this.items,
      required this.onChanged});

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          padding: EdgeInsets.zero,
          value: selectedValue,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
