class BottomIndicatorState {}

class BottomIndicatorInitialState extends BottomIndicatorState {}

class BottomIndicatorIndexChangeState extends BottomIndicatorState {
  final double index;

  BottomIndicatorIndexChangeState({required this.index});
}
