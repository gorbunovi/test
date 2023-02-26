import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/feature/presentation/card/controller/card_controller.dart';
import 'package:test_work/core/core.dart' as core_widgets;
import 'package:test_work/feature/presentation/card/controller/index.dart';
import '../../../../servise_locator.dart';
import '../../home/widgets/index_home_widget.dart';
import '../widgets/preview_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CardController, CardState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              preview: (preview) =>  PreViewWidget(),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardController>(
      create: (context) => sl<CardController>()..init(),
      child: _buildBody(context),
    );
  }
}

