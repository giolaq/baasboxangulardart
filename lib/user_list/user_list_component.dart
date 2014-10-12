library user_list;

import 'package:angular/angular.dart';
import 'package:baasbox/baasbox.dart';
import 'dart:async';


@Component(
    selector: 'user-list',
    templateUrl: 'packages/baasboxAngularDart/user_list/user_list_component.html',
    cssUrl: 'packages/baasboxAngularDart/user_list/user_list_component.css'
    )
class UserComponent {
  List<BaasBoxUser> users;
  BaasBoxContext bbCtxt;

 
  UserComponent() {
    
    users = new List();
    
    BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
    aBBUser.password = 'test';
    Future loginFuture = aBBUser.login();
    Future result = loginFuture.then((value) => aBBUser.fetchUsers().then( (onValue) 
        {
          for ( var user in onValue['data'] ) 
          {
            String name = user['user']['name'];
            users.add(new BaasBoxUser.withUserName(name));
          }
        }
    ));

  }
  
 
 
  
}
