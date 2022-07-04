abstract class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {}

class BottomNavigationSuccess extends BottomNavigationState {
  int index;
  BottomNavigationSuccess({required this.index});
}

class BottomNavigationFailure extends BottomNavigationState {}
