import 'package:app/bloc/root/root_cubit.dart';
import 'package:app/modules/account/screen/account_screen.dart';
import 'package:app/modules/main/bloc/main_cubit.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AccountScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: state.auth.avatar.isEmpty
                            ? const AssetImage(
                                "assets/images/avatar/user_profile.png",
                              )
                            : NetworkImage(
                                state.auth.avatar,
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
                            style: GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: ColorSchema.titleTextColor)),
                          ),
                          Text(
                            state.auth.jabatan,
                            style: GoogleFonts.nunito(textStyle: const TextStyle(color: ColorSchema.subTitleTextColor, fontSize: 12)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    context.read<RootCubit>().confirmAuthDestroy();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue.shade50.withOpacity(0.5)),
                    child: const Icon(
                      Icons.settings_power_sharp,
                      color: Colors.red,
                      size: 30,
                    ),
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
