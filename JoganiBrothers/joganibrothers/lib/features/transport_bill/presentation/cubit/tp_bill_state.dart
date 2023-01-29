import 'package:joganibrothers/features/products/data/models/product_model.dart';

abstract class TransportBillState {}

class BillInitial extends TransportBillState{}

class BillSuccess extends TransportBillState {
  final int val;
  BillSuccess({required this.val});
}

class  CheckState extends TransportBillState {
  final Product val;
  CheckState({required this.val});
}