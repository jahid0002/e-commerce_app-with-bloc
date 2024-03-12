import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online/bloc/sign_up/signin_event.dart';
import 'package:online/bloc/sign_up/signin_state.dart';
import 'package:online/screans/nav_page.dart/nave_page.dart';
import 'package:online/utilsh/const.dart';

class SignInBloc extends Bloc<SigninPageEvent, SigninState> {
  SignInBloc() : super(const SigninState()) {
    on<SigninEvent>(_signInEvent);
    on<ObsecureTextEvent>(_obsecureText);
  }

  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  void _signInEvent(SigninEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: event.model.email, password: event.model.password)
          .then((value) async {
        await store.collection('app').doc(event.model.email).set({
          'userName': event.model.userName,
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
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void _obsecureText(ObsecureTextEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(obsecureText: event.isShow));
  }
}
