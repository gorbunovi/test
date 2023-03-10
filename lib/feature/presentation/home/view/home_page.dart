
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/core.dart' as core_widgets;
import 'package:test_work/core/error/failure.dart';
import 'package:test_work/feature/presentation/home/widgets/home_widget.dart';
import 'package:test_work/feature/presentation/home/widgets/index_home_widget.dart';
import 'package:test_work/servise_locator.dart';

import '../controller/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              page: (controller) => HomeWidget(
                controller: controller,
                back: () async => BlocProvider.of<HomeController>(context).bac(),
                forward: () async => BlocProvider.of<HomeController>(context).forward(),
              ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeController>(
      create: (context) => sl<HomeController>()..init(),
      child: _buildBody(context),
    );
  }
}

