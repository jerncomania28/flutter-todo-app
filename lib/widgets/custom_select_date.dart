import 'package:flutter/material.dart';

class CustomSelectDate extends StatelessWidget {
  final String hint;
  final String selectedDate;
  final Function(String) onChanged;

  const CustomSelectDate(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.selectedDate});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      onChanged(picked.toString().substring(0, 10));
    }
  }

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 25,
      width: 140,
      child: TextField(
        readOnly: true,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
        controller: TextEditingController(text: selectedDate),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 9.0),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 119, 122, 1),
            ),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: Colors.grey[400],
              size: 15,
            )),
        onTap: () => _selectDate(context),
      ),
    );
  }
}
