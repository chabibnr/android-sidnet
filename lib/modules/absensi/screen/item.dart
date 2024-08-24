part of 'absensi_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Absensi model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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
                if (model.absensiNoSpl != null)
                  Text(
                    "${model.absensiNoSpl}",
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                    ),
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Row(
                    children: [
                      const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.outbound_outlined,
                          size: 18,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(model.absensiIn == null || model.absensiIn!.isEmpty ? '-' : model.absensiIn!)
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.outbound_outlined,
                        size: 18,
                        color: Colors.deepPurpleAccent,
                      ),
                      SizedBox(width: 5),
                      Text(model.absensiOut == null || model.absensiOut!.isEmpty ? '-' : model.absensiOut!)
                    ],
                  )
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
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: const Color(0xFF333333),
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
