import 'package:joganibrothers/features/products/data/models/product_model.dart';

abstract class BillState {}

class BillInitial extends BillState{}

class BillSuccess extends BillState {
  final int val;
  BillSuccess({required this.val});
}

class  CheckState extends BillState {
  final Product val;
  CheckState({required this.val});
}