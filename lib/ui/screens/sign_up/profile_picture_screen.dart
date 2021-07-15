import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/AppColors.dart';
import '../../constants/AppSizes.dart';
import '../../widgets/buttons/button_primary.dart';
import '../../widgets/screen/app_appbar_screen.dart';
import 'date_of_birthday_screen.dart';

class ProfilePictureScreen extends StatefulWidget {
  static const String Route = '/sign_up/profile_picture_screen';
  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  late AppState state;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return AppAppBarScreen(
      widget: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 200,
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Upload a profile picture',
                    style: Theme.of(context).textTheme.headline1,
                    children: <TextSpan>[
                      TextSpan(
                        text: '.',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: AppColors.ORANGE,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                'Edit your profile picture anytime',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                imageFile != null
                    ? CircleAvatar(
                        backgroundImage: Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        ).image,
                        radius: 80,
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://180dc.org/wp-content/uploads/2017/11/profile-placeholder.png'),
                        radius: 80,
                        backgroundColor: Colors.white,
                      ),
                Positioned(
                  top: 110,
                  left: 110,
                  child: FloatingActionButton(
                    mini: true,
                    hoverColor: Colors.amberAccent,
                    backgroundColor: Colors.deepOrange,
                    onPressed: () {
                      if (state == AppState.free)
                        _pickImage();
                      else if (state == AppState.picked)
                        _cropImage();
                      else if (state == AppState.cropped) _clearImage();
                    },
                    child: _buildButtonIcon(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Step 5 of 8",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.PRIMARY_SWATCH[200],
                      fontSize: AppSizes.INPUT_TOP_LABEL_TEXT),
                ),
                ButtonPrimary(
                  child: Text(
                    'Next >',
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(DateOfBirthdayScreen.Route);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(Icons.add);
    else if (state == AppState.picked)
      return Icon(Icons.crop);
    else if (state == AppState.cropped)
      return Icon(Icons.clear);
    else
      return Container();
  }

  Future<Null> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
      });
    }
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper 1',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper 2',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }
}
