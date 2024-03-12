

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/nav_bar/navbar_state.dart';
import 'package:online/bloc/nav_bar/navebar_event.dart';

class NavBarBloc extends Bloc<NaveBarEvent, NavBarState>{
    NavBarBloc():super(NavBarState()){
      on<CurrentIndexEvent>(_currentIndexEvent);
    }  


    void _currentIndexEvent(CurrentIndexEvent event, Emitter<NavBarState>emit){
      emit(state.copyWith(index: event.updateIndex)); 
      
    }

}