part of 'account_screen.dart';

changePicture(BuildContext context) {
  final ImagePicker picker = ImagePicker();
  picker.pickImage(source: ImageSource.gallery).then((value) async {
    if (value != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: value.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
          ),
        ],
      );
      if (croppedFile != null) {
        uploadPicture(context, croppedFile);
      }
    }
  });
}

uploadPicture(BuildContext context, CroppedFile file) {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => AccountPhotoCubit()..execute(file),
          child: BlocConsumer<AccountPhotoCubit, AccountPhotoState>(
            listener: (context, state) {
              log("Listener called ${state.status}");
              if (state.status == SubmitStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sukses',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Foto Profil telah diganti.',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                context.read<AccountCubit>().changeAvatar(state.data?.avatar);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Gagal',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${state.data?.respMsg}',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              Navigator.of(context).pop();
            },
            builder: (context, state) {
              return AlertDialog(
                title: const Text('Mengunggah Foto...'),
                icon: CircleAvatar(child: const CircularProgressIndicator()),
                content: SizedBox(),
              );
            },
          ),
        );
      });
}
