import 'package:equatable/equatable.dart';
import 'product_entity.dart';

class PaginatedProductsEntity extends Equatable {
  final List<ProductEntity> products;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  const PaginatedProductsEntity({
    required this.products,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  @override
  List<Object> get props => [
    products,
    total,
    page,
    limit,
    totalPages,
    hasNext,
    hasPrev,
  ];
}
