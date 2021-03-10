
import 'dart:io';

import 'package:dart_counter/api/database_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends ViewModel {

  final DatabaseService _databaseService = locator<DatabaseService>();

  Stream<Profile> profile() => _databaseService.profile(appModel.uid);

  File pickedImage;

  void pickImage() async {
    var i = await ImagePicker().getImage(source: ImageSource.gallery);
    pickedImage = File(i.path);
    notifyListeners();
  }

}
