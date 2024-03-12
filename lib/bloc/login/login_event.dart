
import 'package:equatable/equatable.dart';
import 'package:online/model/login_model.dart';

abstract class LoginEvent extends Equatable{

  const LoginEvent();
  @override
  List<Object?> get props =>[];

}


class EmailPassLoginEvent extends LoginEvent{

 final LoginModel model; 

 const EmailPassLoginEvent({required this.model});

 @override
  List<Object?> get props =>[model];
}



class ObsecureTextLoginEvent extends LoginEvent{
   
final bool isShow; 
const ObsecureTextLoginEvent({required this.isShow});
  @override

  List<Object?> get props => [isShow];

}