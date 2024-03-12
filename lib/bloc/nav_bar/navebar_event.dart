

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NaveBarEvent extends Equatable{
  const NaveBarEvent();
  
  @override
  
  List<Object?> get props => [];
} 

class CurrentIndexEvent extends NaveBarEvent{

  final int updateIndex; 
  final BuildContext context;
  const CurrentIndexEvent({required this.updateIndex, required this.context});



    @override
  
  List<Object?> get props => [updateIndex];
}
