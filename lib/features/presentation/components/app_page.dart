import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_cubit.dart';

// ignore: must_be_immutable
abstract class AppPage<C extends AppCubit<S>, S> extends StatelessWidget {
  final C bloc;
  Widget builder(BuildContext context, S state);

  const AppPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (context) => bloc,
      child: BlocBuilder<C, S>(
        builder: (context, state) {
          return builder(context, state);
        },
      ),
    );
  }
}
