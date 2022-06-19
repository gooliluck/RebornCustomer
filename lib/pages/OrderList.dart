import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/utils.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);
  static var route = '/orders';

  @override
  State<StatefulWidget> createState() => _OrderList();
}

class _OrderList extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (buildContext) {
        return Scaffold(
          appBar: AppBar(
            title: Text(getString(context).orderTitle),
          ),
          body: _expansionPanelList (buildContext),
        );
      },
    );
  }

  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            'isExpanded': false
          });

  Widget _expansionPanelList(BuildContext buildContext) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        elevation: 3,
        // Controlling the expansion behavior
        expansionCallback: (index, isExpanded) {
          setState(() {
            _items[index]['isExpanded'] = !isExpanded;
          });
        },
        animationDuration: const Duration(milliseconds: 600),
        children: _items
            .map(
              (item) => ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor:
            item['isExpanded'] == true ? Colors.cyan[100] : Colors.white,
            headerBuilder: (_, isExpanded) => Container(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text(
                  item['title'],
                  style: const TextStyle(fontSize: 20),
                )),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(item['description']),
            ),
            isExpanded: item['isExpanded'],
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildCell(BuildContext buildContext, int index) {
    return ListTile(
      title: Text('cell : $index'),
    );
  }
}
