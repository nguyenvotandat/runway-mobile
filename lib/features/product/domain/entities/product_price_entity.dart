import 'package:equatable/equatable.dart';

class ProductPriceEntity extends Equatable {
  final double amount;
  final String currency;

  const ProductPriceEntity({required this.amount, this.currency = 'VND'});

  @override
  List<Object> get props => [amount, currency];
}
