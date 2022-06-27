import 'package:flutter/material.dart';

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
      color: Theme.of(context).primaryColor,
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
              title: "Category",
              categories: ["Category", "All", "PH Books", "Others"],
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
  initState(){
    dropDownValue = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
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
          ),
        ),
      ),
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
  initState(){
    selectedDate = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: TextButton(
          onPressed: () {getDate();},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).highlightColor
            ),
            foregroundColor: MaterialStateProperty.all(
              Theme.of(context).dividerColor
            ),
          ),
          child: Text(selectedDate),
        ),
      ),
    );
  }

  void getDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022, 1),
        lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() => selectedDate = pickedDate.toString().substring(0, 10));
    }
  }
}