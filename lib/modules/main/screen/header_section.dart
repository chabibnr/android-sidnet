import 'package:app/modules/account/screen/account_screen.dart';
import 'package:app/modules/main/bloc/main_cubit.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  final Function openDrawer;

  const HeaderSection({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 10,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          openDrawer();
                        },
                        child: state.auth.avatar.isEmpty
                            ? Image.asset(
                                "assets/images/avatar/user_profile.png",
                                width: 60,
                              )
                            : Image.network(
                                state.auth.avatar,
                                width: 60,
                              ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.auth.nama,
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: ColorSchema.titleTextColor)),
                          ),
                          Text(
                            state.auth.jabatan,
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    color: ColorSchema.subTitleTextColor,
                                    fontSize: 16)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue.shade50.withOpacity(0.5)),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: ColorSchema.primaryColor,
                          size: 30,
                        ),
                      ),
                      Positioned(
                          right: 14,
                          top: 14,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
