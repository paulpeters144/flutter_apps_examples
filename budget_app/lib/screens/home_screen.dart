import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/modals/category_modal.dart';
import 'package:flutter_budget_ui/screens/category_screen.dart';
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          forceElevated: true,
          floating: true,
          // pinned: true,
          expandedHeight: 75.0,
          leading: IconButton(
            icon: Icon(Icons.settings),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Simple Budget',
              style: TextStyle(fontSize: 14),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              iconSize: 32.0,
            )
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: BarChart(exspenses: weeklySpending),
                );
              } else {
                final Category category = categories[index - 1];
                double totalAmountSpent = 0;
                for (var e in category.expenses) {
                  totalAmountSpent += e.cost;
                }
                if (totalAmountSpent > category.maxAmount) {
                  totalAmountSpent = category.maxAmount;
                }

                totalAmountSpent = category.maxAmount - totalAmountSpent;

                return _buildCategory(category, totalAmountSpent);
              }
            },
            childCount: 1 + categories.length,
          ),
        )
      ],
    ));
  }

  Widget _buildCategory(Category category, double totalAmountSpent) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryScreen(category: category),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(20.0),
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              double percentSpent = totalAmountSpent / category.maxAmount;

              Color spentBarColor = getBarColorFrom(percentSpent);

              double spentBarSize = constraints.maxWidth * (1 - percentSpent);
              return Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.0,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.0,
                        width: spentBarSize,
                        decoration: BoxDecoration(
                          color: spentBarColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Color getBarColorFrom(double percentSpent) {
    if (percentSpent > .65) {
      return Colors.green;
    } else if (percentSpent > .35) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }
}
