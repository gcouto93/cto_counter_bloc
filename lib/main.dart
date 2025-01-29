import 'package:cto_counter_bloc/home_page.dart';
import 'package:cto_counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:cto_counter_bloc/page_bloc/counter_bloc_page.dart';
import 'package:cto_counter_bloc/page_cubit/counter_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
      '/bloc': (_) => BlocProvider(create: (_) => CounterBloc(), child: CounterBlocPage()),
      '/cubit': (_) => const CounterCubitPage(),
    },
  ));
}
