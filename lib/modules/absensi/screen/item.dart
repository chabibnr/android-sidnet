part of 'absensi_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Absensi model;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ColorConfig.primary],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${model.absensiHari}, ${model.tanggal}",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: ColorSchema.primaryColor,
                  ),
                ),
                if (model.absensiNoSpl != null) Text("${model.absensiNoSpl}"),
                if (model.absensiLibur == true)
                  Text(
                    'Libur',
                    style: GoogleFonts.nunito(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
          if (model.hasIn)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildReports(
                    "MASUK",
                    model.absensiIn == null || model.absensiIn!.isEmpty ? '-' : model.absensiIn!,
                    Colors.lightBlueAccent.shade400.withOpacity(0.25),
                    "assets/icons/icon_svg/sale_service_icon.svg",
                    screenWidth,
                    context,
                  ),
                  buildReports(
                    "PULANG",
                    model.absensiOut == null || model.absensiOut!.isEmpty ? '-' : model.absensiOut!,
                    Colors.purple.shade200.withOpacity(0.25),
                    "assets/icons/icon_svg/purchase_service_icon.svg",
                    screenWidth,
                    context,
                  ),
                ],
              ),
            ),
          if (model.showDescription)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.red.shade100,
                  border: Border.fromBorderSide(BorderSide(
                    color: Colors.red.shade100,
                  ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.jenisAbsensiNama != null)
                    Text(
                      "${model.jenisAbsensiNama}",
                      style: GoogleFonts.nunito(
                        color: Colors.red.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  if (model.keterangan != null && model.keterangan!.isNotEmpty)
                    Text(
                      "${model.keterangan}",
                      style: GoogleFonts.nunito(
                        color: Colors.red.shade400,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }

  GestureDetector buildReports(
    String title,
    String amount,
    Color reportColor,
    reportIcon,
    double screenWidth,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth * 0.40,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: reportColor,
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorSchema.primaryColor, reportColor],
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                children: [
                  TextSpan(text: amount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
