import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:baasbox/baasbox.dart';
import 'dart:async';

/* Use the Controller annotation to indicate that this class is an
 * Angular Directive. The compiler will instantiate the directive if
 * it finds it in the DOM.
 *
 * The selector field defines the CSS selector that will trigger the
 * directive. It can be any valid CSS selector which does not cross
 * element boundaries.
 *
 * The publishAs field specifies that the directive instance should be
 * assigned to the current scope under the name specified.
 *
 * The directive's public fields are available for data binding from the view.
 * Similarly, the directive's public methods can be invoked from the view.
 */
@Controller(
    selector: '[user-list]',
    publishAs: 'UserCtrl')
class UserController {
  List<BaasBoxUser> users;
  BaasBoxContext bbCtxt;

 
  UserController() {
    
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
 

class UserModule extends Module {
  UserModule() {
    bind(UserController);
  }
}
 
main() {
  applicationFactory()
      .addModule(new UserModule())
      .run();
}