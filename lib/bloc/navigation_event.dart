abstract class NavigationEvent {}

class GoToPage1 extends NavigationEvent {}
class GoToPage2 extends NavigationEvent {
  final String username;
  GoToPage2(this.username);
}
class GoToPage3 extends NavigationEvent {}
class GoToPage4 extends NavigationEvent {}
