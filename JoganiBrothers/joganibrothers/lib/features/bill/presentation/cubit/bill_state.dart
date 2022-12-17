abstract class BillState {}

class BillInitial extends BillState{}

class BillSuccess extends BillState {
  final int val;
  BillSuccess({required this.val});
}
