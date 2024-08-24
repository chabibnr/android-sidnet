part of 'gaji_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Gaji model;
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
            "${model.gajiPeriode}",
            style: GoogleFonts.nunito(
              fontSize: 15,
              color: ColorSchema.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Gaji Pokok",
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
                  "${model.gajiPokok}",
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Gaji Kotor",
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
                  '${model.gajiBruto}',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Total Potongan",
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
                  "${model.gajiTotalPot}",
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Gaji Bersih",
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
                  "${model.gajiNetto}",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorConfig.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
