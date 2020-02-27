import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class User {
  String userId;

  User(this.userId);
}

class StateContainer extends StatefulWidget {
  final Widget child;
  final User user;

  StateContainer({
    @required this.child,
    this.user,
  });

  

  static StateContainerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedStateContainer>().data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
  
}

class StateContainerState extends State<StateContainer> {
  User user;

  void updateUserInfo({userId}) {
    if (user == null) {
      user = new User(userId);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.userId = userId ?? user.userId;
      });
    }
  }

  String getUser(){
    return user.userId;
  }



  @override
  Widget build(BuildContext context) {
    
    return new InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedStateContainer extends InheritedWidget {

  final StateContainerState data;

  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super (key: key, child: child);

  @override
  bool updateShouldNotify(InheritedStateContainer old) => true;  
}
