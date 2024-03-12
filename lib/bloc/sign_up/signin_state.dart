



import 'package:equatable/equatable.dart';

class SigninState extends Equatable{

   final bool isLoading; 
   final String signInFeedBack; 
   final Statas statas;  
   final bool obsecureText ;


   const SigninState({this.isLoading = false, this.signInFeedBack = 'plasse wait', this.statas = Statas.fail, this.obsecureText = true});

   

   SigninState copyWith({bool? isLoading, String? signInFeedBack, Statas? statas, bool? obsecureText}){
       return SigninState(
        isLoading: isLoading?? this.isLoading, 
        signInFeedBack: signInFeedBack?? this.signInFeedBack, 
        statas: statas?? this.statas,
        obsecureText: obsecureText?? this.obsecureText,
       );
   }



  @override
  List<Object?> get props => [isLoading, signInFeedBack, statas, obsecureText];
}


enum Statas {success, fail}