import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../cubit/home_cubit.dart';
import '../widgets/build_mobile_layout.dart';
import '../widgets/build_web_layout.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.isMobile) {
                  return BuildMobileLayout(state: state);
                } else {
                  return BuildWebLayout(state: state);
                }
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
