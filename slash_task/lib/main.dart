// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:slash_task/presentation/cubit/home_cubit.dart';
import 'package:slash_task/presentation/views/main_view.dart';
import 'data/services/data_services.dart';
import 'domain/repositories/product_repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(ProductRepositoryImpl(DataService()))
            ..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        title: 'Slash App',
        theme: ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
        home: const MainView(),
      ),
    );
  }
}