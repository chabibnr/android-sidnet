import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_add/absensi_add_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/utils/contstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'form_part.dart';

class AbsensiAddScreen extends StatefulWidget {
  const AbsensiAddScreen({super.key, required this.model});

  final Absensi model;

  @override
  State<AbsensiAddScreen> createState() => _AbsensiAddScreenState();
}

class _AbsensiAddScreenState extends State<AbsensiAddScreen> {
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Absensi"),
          actions: [IconButton(onPressed: switchCamera, icon: Icon(Icons.cameraswitch_outlined))],
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => AbsensiAddCubit()..load(widget.model),
          child: BlocConsumer<AbsensiAddCubit, AbsensiAddState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              log("Reload ${state.isLoading}");
              if (state.isLoading && state.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = state.data;
              if (data != null) {
                return Container(
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
                        Container(
                          child: FutureBuilder<void>(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                // If the Future is complete, display the preview.
                                return CameraPreview(_controller);
                              } else {
                                // Otherwise, display a loading indicator.
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Container(
                          child: ListTile(
                            title: Text("Lokasi Sekarang"),
                            subtitle: Text("${_position?.latitude},${_position?.longitude}"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        _controller.takePicture();
                                      },
                                      child: Text("Ambil Gambar"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AbsensiAddfScreen extends StatelessWidget {
  final Absensi model;

  const AbsensiAddfScreen({super.key, required this.model});

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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("AbsensiAdd Screen Title"),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => AbsensiAddCubit()..load(model),
          child: BlocConsumer<AbsensiAddCubit, AbsensiAddState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              log("Reload ${state.isLoading}");
              if (state.isLoading && state.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = state.data;
              if (data != null) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: FormPart(
                      isLoading: state.isLoading,
                      model: data,
                      formKey: state.formKey,
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
      ),
    );
  }
}
