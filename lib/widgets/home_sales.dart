import 'package:flutter/material.dart';
import 'package:faithstore/services/sale.dart';

class HomeSales extends StatefulWidget {
  const HomeSales({Key? key, required this.salesList}) : super(key: key);

  final List<Sale> salesList;

  @override
  State<HomeSales> createState() => _HomeSalesState();
}

class _HomeSalesState extends State<HomeSales> {

  /// Renders the sales in [widget.salesList] in a dated
  /// format (assuming the list is chronologically sorted
  /// starting from newest.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.salesList.length,
      itemBuilder: (BuildContext context, int index) {
        List<Sale> sales = widget.salesList;
        return Column(
          children: [
            SizedBox(
              child: isDifferentDay(index)
                ? Row(
                    children: [
                      const Expanded(child: Divider()),
                      Text(formatDate(sales[index].saleTime)),
                      const Expanded(child: Divider()),
                    ],
                  )
                :const SizedBox(height: 0.0),
            ),
            sales[index].renderSaleWidget(context),
          ],
        );
      },
    );
  }

  /// Checks if the [thisSale] was made on a different day from
  /// [currentDate].
  bool isDifferentDay(int currIndex) {
    if (currIndex == 0) {
      return true;
    }
    Sale sale1 = widget.salesList[currIndex];
    Sale sale2 = widget.salesList[currIndex - 1];
    return (sale1.saleTime.day != sale2.saleTime.day
        || sale1.saleTime.month != sale2.saleTime.month
        || sale1.saleTime.year != sale2.saleTime.year);
  }

  /// Returns a formatted version of [date]. Format - "YYYY-MM-DD"
  String formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
