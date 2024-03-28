import 'package:flutter/material.dart';
import 'package:shopmate/ui/common/ui_helpers.dart';
import 'package:shopmate/ui/views/widgets/joystikWidget/dwnwd_triangle.dart';
import 'package:shopmate/ui/views/widgets/joystikWidget/frwrd_triangle.dart';
import 'package:shopmate/ui/views/widgets/joystikWidget/lftwrd_triangle.dart';
import 'package:shopmate/ui/views/widgets/joystikWidget/rgtward_triangle.dart';
import 'package:shopmate/ui/views/widgets/joystikWidget/stop_button.dart';
import 'package:stacked/stacked.dart';

import 'controll_cart_viewmodel.dart';

class ControllCartView extends StatelessWidget {
  const ControllCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ControllCartViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Cart Control"),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 9,
                            left: 76,
                            child: ForwardTriangle(
                              onTap: () => model.isBoatMovement('f'),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            right: 13,
                            left: 16,
                            child: Row(
                              children: [
                                LeftwardTriangle(
                                  onTap: () => model.isBoatMovement('l'),
                                ),
                                horizontalSpaceSmall,
                                StopButton(
                                  onTap: () => model.isBoatMovement('s'),
                                ),
                                horizontalSpaceSmall,
                                RightwardTriangle(
                                  onTap: () => model.isBoatMovement('r'),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 76,
                            child: DownwardTriangle(
                              onTap: () => model.isBoatMovement('b'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMassive
                  ],
                ),
              ),
            ));
      },
      viewModelBuilder: () => ControllCartViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.onModelReady();
      },
    );
  }
}
