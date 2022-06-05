import 'package:flutter/material.dart';
import 'package:full_screen_date_picker/full_screen_date_picker.dart';

class SalesBottom extends StatefulWidget {
  const SalesBottom({Key? key}) : super(key: key);

  @override
  State<SalesBottom> createState() => _SalesBottomState();
}

class _SalesBottomState extends State<SalesBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: const Color.fromRGBO(140, 140, 140, 0.5),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: _DateFilter(title: "Start Date",),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text("to"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: _DateFilter(title: "End Date",),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: _CategoryFilter(
              title: "BookCategory",
              categories: ["BookCategory", "All", "PH Books", "Others"],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: _CategoryFilter(
              title: "User", categories: ["User","All", "Admin", "Sales"],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryFilter extends StatefulWidget {
  const _CategoryFilter({
    Key? key, required this.title, required this.categories,
  }) : super(key: key);

  final String title;
  final List<String> categories;

  @override
  State<_CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<_CategoryFilter> {
  String dropDownValue = "";

  @override
  Widget build(BuildContext context) {
    if (dropDownValue == "") {
      dropDownValue = widget.title;
    }
    return DropdownButton<String>(
      value: dropDownValue,
      items: widget.categories
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, textAlign: TextAlign.center),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropDownValue = value!;
        });
      },
    );
  }
}

class _DateFilter extends StatefulWidget {
  const _DateFilter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<_DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<_DateFilter> {
  String selectedDate = "";

  @override
  Widget build(BuildContext context) {
    if (selectedDate == "") {
      selectedDate = widget.title;
    }
    return TextButton(
      onPressed: () {getDate();},
      child: Text(
        selectedDate,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  void getDate() async {
    DateTime date = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FullScreenDatePicker(
        title: "Select ${widget.title}",
      )),
    );
    setState(() => selectedDate = date.toString().substring(0, 10));
  }
}