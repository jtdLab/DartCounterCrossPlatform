import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateGameViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).createGame),
        ),
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Spacer(flex: 8,),
                  Expanded(
                    flex: 359,
                    child: Column(
                      children: [
                        Spacer(flex: 4,),
                        Expanded(
                          flex: 115,
                          child: DartBotCard(),
                        ),
                        Spacer(flex: 4,),
                        Expanded(
                          flex: 171,
                          child: PlayersCard(GameSnapshot.seed(Status.pending).players),
                        ),
                        Spacer(flex: 4,),
                        Expanded(
                          flex: 281,
                          child: GameSettingsCard(),
                        ),
                        Spacer(flex: 36,),
                        Expanded(
                          flex: 75,
                          child: ActionButton(
                            text: AppLocalizations.of(context).startGame,
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.gameHistory),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 8,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DartBotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        'Dartbot',
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: CupertinoSwitch(
        value: true,
      ),
      body: Column(
        children: [
          Spacer(
            flex: 13,
          ),
          AutoSizeText(
            'Dartbot Average',
            maxLines: 1,
          ),
          Spacer(
            flex: 11,
          ),
          Expanded(
            flex: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 284,
                  child: CupertinoSlider(
                  value: 1,
                ),
                ),
                Spacer(flex: 30,),
                AutoSizeText(
                  '88',
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayersCard extends StatelessWidget {

  List<PlayerSnapshot> players;

  PlayersCard(this.players);

  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        'Spieler',
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      paddingBody: EdgeInsets.all(0.0),
      body: Column(
        children: [
          Expanded(
            child: Placeholder(),
          ),
          Expanded(
              child: Placeholder(color: AppColors.green,),
          ),
        ],
      ),
    );
  }
}

class PlayerItem extends StatelessWidget {

  PlayerSnapshot player;

  PlayerItem(this.player);

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class GameSettingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        'Modus',
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      body: Row(
        children: [
          Spacer(
            flex: 25,
          ),
          Expanded(
            flex: 328,
            child: Column(
              children: [
                Spacer(
                  flex: 13,
                ),
                AutoSizeText(
                  'Startwert',
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: '0',
                          children: {'0': Text('301'), '1': Text('501'), '2': Text('701')},
                          onValueChanged: (v) => {},
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 20,
                ),
                AutoSizeText(
                  'Spielmodus',
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: '0',
                            children: {
                              '0': Text(
                                'FIRST TO',
                              ),
                              '1': Text(
                                'BEST OF',
                              )
                            },
                            onValueChanged: (v) => {},
                          ),
                      ),
                    ],
                  )
                ),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 37,
                  child: CupertinoPicker(
                    children: [for (var i = 1; i <= 100; i += 1) Text(i.toString())],
                    itemExtent: 25,
                    onSelectedItemChanged: (item) => {},
                  ),
                ),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: '0',
                            children: {'0': Text('LEGS'), '1': Text('SETS')},
                            onValueChanged: (v) => {},
                          ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 17,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 25,
          ),
        ],
      ),
    );
  }
}
