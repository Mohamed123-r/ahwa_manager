class Order {
  final int id;
  final String customerName;
  final String drinkType;
  final String instructions;
  bool isCompleted;

  Order(this.id, this.customerName, this.drinkType, this.instructions, this.isCompleted);
}