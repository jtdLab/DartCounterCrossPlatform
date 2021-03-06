import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_text_button.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CheckoutDetailsViewModel>(
      builder: (context, model, child) => View(
          child: Row(
        children: [
          Spacer(
            flex: 25,
          ),
          Expanded(
            flex: 325,
            child: Column(
              children: [
                Spacer(
                  flex: 53,
                ),
                Expanded(
                  flex: 24,
                  child: AutoSizeText(
                    'Darts aufs Doppel - TODO',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                Spacer(
                  flex: 15,
                ),
                Expanded(
                  flex: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '1',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '2',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '3',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 27,),
                // TODO divider
                Spacer(
                  flex: 12,
                ),
                Expanded(
                  flex: 24,
                  child: AutoSizeText(
                    'Darts Gesamt - TODO',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                Spacer(
                  flex: 15,
                ),
                Expanded(
                  flex: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '1',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '2',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PrimaryTextButton(
                          text: '3',
                          fontSize: 45,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 27,),
                // TODO divider
                Spacer(flex: 27,),
                Expanded(
                  flex: 75,
                  child: ActionButton(
                    text: AppLocalizations.of(context).confirm,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Spacer(flex: 154,),
                Expanded(
                  flex: 82,
                  child: Image.asset(AppImages.adBanner),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 25,
          ),
        ],
      )),
    );
  }
}
