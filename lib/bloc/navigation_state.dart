abstract class NavigationState {}

class Page1State extends NavigationState {}
class Page2State extends NavigationState {
  final String username;
  Page2State(this.username);
}
class Page3State extends NavigationState {}
class Page4State extends NavigationState {}
