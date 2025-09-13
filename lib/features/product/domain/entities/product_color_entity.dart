import 'package:equatable/equatable.dart';

class ProductColorEntity extends Equatable {
  final String id;
  final String name;
  final String hex;

  const ProductColorEntity({
    required this.id,
    required this.name,
    required this.hex,
  });

  @override
  List<Object> get props => [id, name, hex];
}
