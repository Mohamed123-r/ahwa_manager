import '../models/order_model.dart';

abstract class OrderManager {
  void addOrder(String customerName, String drinkType, String instructions);
  void markOrderCompleted(int orderId);
  List<Map<String, dynamic>> getPendingOrders();
  Map<String, dynamic> generateSalesReport();
}

class AhwaOrderManager implements OrderManager {
  final List<Order> _orders = [];
  int _nextId = 1;

  @override
  void addOrder(String customerName, String drinkType, String instructions) {
    _orders.add(Order(_nextId++, customerName, drinkType, instructions, false));
  }

  @override
  List<Map<String, dynamic>> getPendingOrders() {
    return _orders
        .where((o) => !o.isCompleted)
        .map(
          (o) => {
            'id': o.id,
            'customerName': o.customerName,
            'drinkType': o.drinkType,
            'instructions': o.instructions,
          },
        )
        .toList();
  }

  @override
  Map<String, dynamic> generateSalesReport() {
    final salesCount = <String, int>{};
    for (var order in _orders) {
      salesCount[order.drinkType] = (salesCount[order.drinkType] ?? 0) + 1;
    }
    return {
      'topSellingDrink':
          salesCount.entries.reduce((a, b) => a.value > b.value ? a : b).key,
      'totalOrders': _orders.length,
    };
  }

  @override
  void markOrderCompleted(int orderId) {
    final order = _orders.firstWhere(
      (o) => o.id == orderId,
      orElse: () => throw Exception('Order not found'),
    );
    order.isCompleted = true;
  }
}
