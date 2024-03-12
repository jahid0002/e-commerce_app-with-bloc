


// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online/bloc/login/login_event.dart';
import 'package:online/bloc/login/login_state.dart';
import 'package:online/bloc/sign_up/signin_state.dart';
import 'package:online/screans/nav_page.dart/nave_page.dart';
import 'package:online/utilsh/const.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

LoginBloc():super(const LoginState()){
  on<EmailPassLoginEvent>(_emailPassLoginEvent); 
  on<ObsecureTextLoginEvent>(_obsecureTextLoginEvent);
}



  final auth = FirebaseAuth.instance; 
  final store = FirebaseFirestore.instance;


  void _emailPassLoginEvent(EmailPassLoginEvent event , Emitter<LoginState>emit)async{

   emit(state.copyWith(isLoading: true));


     try{
    await auth.signInWithEmailAndPassword(email: event.model.email, password: event.model.password).then((value) async {
        final thisperson = await store.collection('app').doc(event.model.email).get(); 

        // ignore: unnecessary_null_comparison
        if(thisperson != null){
          emit(state.copyWith(isLoading: false));
          AppName.pushReplacement(context: event.model.context, object: const NavePage());
        }else{
            await store.collection('app').doc(event.model.email).set({
          'userName': 'Bangla vai',
          'password': event.model.password,
          'email': event.model.email,
          'profetion': '?',
          'blood': '',
          'image': null,
          'token': '',
          'wishList': false,
          'address' : 'Dhaka'
        }).then((value) {
          emit(state.copyWith(
              isLoading: false,
              statas: Statas.success,
              signInFeedBack: 'Welcome to our family')); 
                AppName.pushReplacement(context: event.model.context, object: const NavePage());
        }).onError((error, stackTrace) {
          emit(state.copyWith(
              isLoading: false,
              statas: Statas.fail,
              signInFeedBack: error.toString())); 
            
        }).onError((error, stackTrace) {
          emit(state.copyWith(
              isLoading: false,
              statas: Statas.fail,
              signInFeedBack: error.toString()));
        });
        }
    }).onError((error, stackTrace) {emit(state.copyWith(
              isLoading: false,
              statas: Statas.fail,
              signInFeedBack: error.toString()));
              
              
              
               });


     }catch(e){
      throw Exception(e.toString());
     }
  } 


  void _obsecureTextLoginEvent(ObsecureTextLoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(obsecureText: event.isShow));
  }

}