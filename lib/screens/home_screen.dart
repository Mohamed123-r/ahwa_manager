import 'package:flutter/material.dart';

import '../managers/order_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AhwaOrderManager _manager = AhwaOrderManager();
  final _customerController = TextEditingController();
  final _drinkController = TextEditingController();
  final _instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,

        title: const Text(
          'Ahwa Manager',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: _customerController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                  gapPadding: 10,
                ),
                labelText: 'Customer Name',
              ),
            ),
            TextField(
              controller: _drinkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                  gapPadding: 10,
                ),
                labelText: 'Drink Type',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _instructionsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                  gapPadding: 10,
                ),

                labelText: 'prace',
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.brown,
              onPressed: () {
                _manager.addOrder(
                  _customerController.text,
                  _drinkController.text,
                  _instructionsController.text,
                );
                setState(() {});
                _customerController.clear();
                _drinkController.clear();
                _instructionsController.clear();
              },
              child: const Text(
                'Add Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _manager.getPendingOrders().length,
                itemBuilder: (context, index) {
                  final order = _manager.getPendingOrders()[index];
                  return ListTile(
                    title: Text(
                      '${order['customerName']} - ${order['drinkType']}',
                    ),
                    subtitle: Text(order['instructions']),
                    trailing: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        _manager.markOrderCompleted(order['id']);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.brown,
              onPressed: () {
                final report = _manager.generateSalesReport();
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Sales Report'),
                        content: Text(
                          'Top Drink: ${report['topSellingDrink']}\nTotal Orders: ${report['totalOrders']}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                );
              },
              child: const Text(
                'Generate Report',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
