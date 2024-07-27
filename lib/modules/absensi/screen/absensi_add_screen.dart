import 'dart:developer';
import 'dart:io';

import 'package:app/helper/form_state.dart';
import 'package:app/modules/absensi/bloc/absensi_add/absensi_add_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/utils/contstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AbsensiAddScreen extends StatelessWidget {
  const AbsensiAddScreen({super.key, required this.model});

  final Absensi model;

  _determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Geolocator.getCurrentPosition().then((position) {
      context.read<AbsensiAddCubit>().setPosition(position);
    });
  }

  openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.camera).then((value) {
      context.read<AbsensiAddCubit>().setPhoto(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorSchema.primaryColor, Colors.white],
        ),
      ),
      child: BlocProvider(
        create: (context) => AbsensiAddCubit()..load(model),
        child: BlocConsumer<AbsensiAddCubit, AbsensiAddState>(
          listener: (context, state) {
            if (state.position == null) {
              _determinePosition(context);
            }
          },
          builder: (context, state) {
            log("Reload ${state.isLoading}");
            if (state.isLoading && state.data == null) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final data = state.data;
            if (data != null) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Absensi"),
                ),
                body: Container(
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state.photo != null)
                          Image.file(
                            File(state.photo!.path),
                            width: 200,
                          ),
                        if (state.photo == null)
                          const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text("Silahkan ambil foto untuk absensi"),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: Icon(Icons.camera_alt_outlined),
                                  onPressed: () {
                                    openCamera(context);
                                  },
                                  label: Text("Ambil Foto"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: state.photo == null
                    ? null
                    : FloatingActionButton.extended(
                        extendedPadding: EdgeInsets.symmetric(horizontal: 24),
                        onPressed: () {
                          if (state.status != SubmitStatus.progress) {
                            context.read<AbsensiAddCubit>().execute();
                          }
                        },
                        label: Text(
                          state.status != SubmitStatus.progress ? "Simpan Absensi" : "Menyimpan...",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: ColorSchema.primaryColor,
                        icon: state.status == SubmitStatus.progress
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                      ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}

class AbsensixAddScreen extends StatefulWidget {
  const AbsensixAddScreen({super.key, required this.model});

  final Absensi model;

  @override
  State<AbsensixAddScreen> createState() => _AbsensiAddScreenState();
}

class _AbsensiAddScreenState extends State<AbsensixAddScreen> {
  XFile? photo;

  late CameraController _controller;
  late List<CameraDescription> _cameras;
  Future<void>? _initializeControllerFuture;
  Position? _position;
  int positionCamera = 0;

  @override
  initState() {
    super.initState();
    _determinePosition();
    availableCameras().then((v) {
      _cameras = v;
      _controller = CameraController(_cameras[positionCamera], ResolutionPreset.max);
      setState(() {
        _initializeControllerFuture = _controller.initialize();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  openCamera() async {
    final ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        photo = value;
      });
    });
  }

  switchCamera() {
    _controller.setDescription(_cameras[positionCamera == 1 ? 0 : 1]);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Geolocator.getCurrentPosition().then((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorSchema.primaryColor, Colors.white],
        ),
      ),
      child: BlocProvider(
        create: (context) => AbsensiAddCubit()..load(widget.model),
        child: BlocConsumer<AbsensiAddCubit, AbsensiAddState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            log("Reload ${state.isLoading}");
            if (state.isLoading && state.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final data = state.data;
            if (data != null) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Absensi"),
                ),
                body: Container(
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (photo != null)
                          Image.file(
                            File(photo!.path),
                            width: 200,
                          ),
                        if (photo == null)
                          Container(
                            height: 200,
                            child: Center(
                              child: Text("Silahkan ambil foto untuk absensi"),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: Icon(Icons.camera_alt_outlined),
                                  onPressed: () {
                                    openCamera();
                                  },
                                  label: Text("Ambil Foto"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: photo == null
                    ? null
                    : FloatingActionButton.extended(
                        extendedPadding: EdgeInsets.symmetric(horizontal: 24),
                        onPressed: () {},
                        label: const Text(
                          "Simpan Absensi",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: ColorSchema.primaryColor,
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
