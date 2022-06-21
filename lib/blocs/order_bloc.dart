

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooliluck_customer_controller/utils.dart';

class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOrder extends OrderEvent {
  final int id;

  FetchOrder(this.id);

  @override
  List<Object> get props => [this.id];
}

class FetchOrders extends OrderEvent {
  final offset;
  final max;
  final clickedPage;
  final field;
  final ascending;

  FetchOrders(
      {this.ascending,
        this.field,
        @required this.offset,
        @required this.max,
        @required this.clickedPage});

  @override
  List<Object> get props =>
      [this.ascending, this.field, this.offset, this.max, this.clickedPage];
}

class OrdersBloc extends Bloc<OrderEvent, OrderState> {

  OrdersBloc() : super(OrderIsLoading()) {
    on<FetchOrders>(_itemsFetch);
  }

  void _itemsFetch(FetchOrders event, Emitter<OrderState> emit) async {
    emit(OrderIsLoading());
    try {
      logI('fetching ${event.offset} ');

      logI('Author code:${serverItems.statusCode}');
      emit(OrdersIsLoaded(serversItems: serverItems));
    } catch (exception) {
      print(exception);
      emit(OrderLoadingError(exception.toString()));
    }
  }

}


class OrderIsLoading extends OrderState {}

class OrderIsUploaded extends OrderState {
  final singleItem;

  OrderIsUploaded({@required this.singleItem});

  @override
  List<Object> get props => [this.singleItem];
}

class OrderIsLoaded extends OrderState {
  final singleItem;

  OrderIsLoaded({@required this.singleItem});

  @override
  List<Object> get props => [this.singleItem];
}


class OrdersIsLoaded extends OrderState {
  final serversItems;

  OrdersIsLoaded({@required this.serversItems});

  @override
  List<Object> get props => [this.serversItems];
}

class OrderLoadingError extends OrderState {
  final _message;

  OrderLoadingError(this._message);

  String get error => _message;

  @override
  List<Object> get props => [this._message];
}


class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}