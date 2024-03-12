


import 'package:equatable/equatable.dart';
import 'package:online/bloc/sign_up/signin_state.dart';

class LoginState extends Equatable{

  final bool isLoading; 
   final String signInFeedBack; 
   final Statas statas;  
   final bool obsecureText ;


   const LoginState({this.isLoading = false, this.signInFeedBack = 'plasse wait', this.statas = Statas.fail, this.obsecureText = true});

   

   LoginState copyWith({bool? isLoading, String? signInFeedBack, Statas? statas, bool? obsecureText}){
       return LoginState(
        isLoading: isLoading?? this.isLoading, 
        signInFeedBack: signInFeedBack?? this.signInFeedBack, 
        statas: statas?? this.statas,
        obsecureText: obsecureText?? this.obsecureText,
       );
   }



  @override
  List<Object?> get props => [isLoading, signInFeedBack, statas, obsecureText];
}
