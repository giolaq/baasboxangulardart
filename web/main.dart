import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:baasboxAngularDart/user_list/user_list_component.dart';

class UserModule extends Module {
  UserModule() {
    bind(UserComponent);
  }
}
 
main() {
  applicationFactory()
      .addModule(new UserModule())
      .run();
}