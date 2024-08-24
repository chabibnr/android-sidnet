part of 'cuti_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Cuti model;
  final double columnSize = 120.0;
  final double valueSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            "${model.cutiNomor}",
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorSchema.primaryColor,
            ),
          ),
          const Divider(
            color: ColorSchema.primaryColor,
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Diajukan Pada",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(":"),
              ),
              SizedBox(
                width: valueSize,
                child: Text(
                  "${model.cutiTanggal}",
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Periode Tgl.",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(":"),
              ),
              Text(
                "${model.periode}",
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Keperluan",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(":"),
              ),
              Text(
                "${model.cutiKeperluan}",
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Status",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(":"),
              ),
              SizedBox(
                width: valueSize,
                child: Text(
                  "${model.cutiStatus}",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (model.hasReason)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.red.shade100,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.red.shade100,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.cutiAlasanPenolakan}",
                    style: GoogleFonts.nunito(
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
