

import 'package:equatable/equatable.dart';
import 'package:online/model/sign_in_model.dart';

abstract class SigninPageEvent extends Equatable{

  const SigninPageEvent();

  @override

  List<Object?> get props => [];



}


class SigninEvent extends SigninPageEvent{

  final SignInModel model; 
  const SigninEvent({required this.model});



  @override

  List<Object?> get props => [model];


} 

class ObsecureTextEvent extends SigninPageEvent{
   
final bool isShow; 
const ObsecureTextEvent({required this.isShow});
  @override

  List<Object?> get props => [isShow];

}