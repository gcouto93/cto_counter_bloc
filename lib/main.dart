import 'package:cto_counter_bloc/aula_5/aula5_home_page.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/bloc_freezed/example_freezed_bloc.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/bloc_freezed_example.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/example_bloc.dart';
import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc_example.dart';
import 'package:cto_counter_bloc/aula_5/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:cto_counter_bloc/aula_5/features/contacts/list/contacts_list_page.dart';
import 'package:cto_counter_bloc/home_page.dart';
import 'package:cto_counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:cto_counter_bloc/page_bloc/counter_bloc_page.dart';
import 'package:cto_counter_bloc/page_cubit/counter_cubit_page.dart';
import 'package:cto_counter_bloc/page_cubit/cubit/counter_cubit.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ContactsRepositories(),
    child: MaterialApp(
      home: HomePage(),
      routes: {
        '/bloc': (_) => BlocProvider(create: (_) => CounterBloc(), child: CounterBlocPage()),
        '/cubit': (_) => BlocProvider(create: (_) => CounterCubit(), child: const CounterCubitPage()),
        '/aula5': (_) => BlocProvider(create: (_) => CounterCubit(), child: const Aula5HomePage()),
        '/bloc/example': (_) =>
            BlocProvider(create: (_) => ExampleBloc()..add(ExampleFindNameEvent()), child: const BlocExample()),
        '/bloc/example/freezed': (_) => BlocProvider(
            create: (_) => ExampleFreezedBloc()..add(ExampleFreezedEvent.findNames()),
            child: const BlocFreezedExample()),
        '/contacts/list': (_) => BlocProvider(
            create: (context) => ContactListBloc(repository: context.read<ContactsRepositories>()),
            child: ContactsListPage()),
      },
    ),
  ));
}
