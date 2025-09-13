import 'package:equatable/equatable.dart';

class ProductInventoryEntity extends Equatable {
  final int quantity;
  final int safetyStock;
  final DateTime updatedAt;

  const ProductInventoryEntity({
    required this.quantity,
    required this.safetyStock,
    required this.updatedAt,
  });

  bool get isInStock => quantity > 0;
  bool get isLowStock => quantity <= safetyStock;

  @override
  List<Object> get props => [quantity, safetyStock, updatedAt];
}
