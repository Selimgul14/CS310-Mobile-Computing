import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project/routes/onboarding_controller.dart';
import 'package:project/utils/colors.dart';
import 'package:project/utils/dimensions.dart';
import 'package:project/utils/styles.dart';
import 'package:project/routes/welcomepage.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: onboardingPageTextStyle,
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: Dimen.onboardingPadding,
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: onboardingPageSubTextStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                      (index) => Obx(() {
                    return Container(
                      margin: Dimen.smallPadding,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: MaterialButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/welcome");
                },
                color: AppColors.buttonColor1,
                child: Text(
                  "Skip",
                  style: ButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}