import 'package:cto_counter_bloc/aula_5/aula5_home_page.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/example_bloc.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc_example.dart';
import 'package:cto_counter_bloc/home_page.dart';
import 'package:cto_counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:cto_counter_bloc/page_bloc/counter_bloc_page.dart';
import 'package:cto_counter_bloc/page_cubit/counter_cubit_page.dart';
import 'package:cto_counter_bloc/page_cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
      '/bloc': (_) => BlocProvider(create: (_) => CounterBloc(), child: CounterBlocPage()),
      '/cubit': (_) => BlocProvider(create: (_) => CounterCubit(), child: const CounterCubitPage()),
      '/aula5': (_) => BlocProvider(create: (_) => CounterCubit(), child: const Aula5HomePage()),
      '/bloc/example': (_) => BlocProvider(create: (_) => ExampleBloc(), child: const BlocExample()),
    },
  ));
}
