import 'package:equatable/equatable.dart';

class ProductImageEntity extends Equatable {
  final String id;
  final String url;
  final int sortOrder;

  const ProductImageEntity({required this.id, required this.url, this.sortOrder = 0});

  @override
  List<Object> get props => [id, url, sortOrder];
}