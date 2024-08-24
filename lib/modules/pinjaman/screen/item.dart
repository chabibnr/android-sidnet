part of 'pinjaman_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Pinjaman model;

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
            "${model.pinjamanCode}",
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
                  "Tanggal",
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
                  "${model.pinjamanDate}",
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Lama Pinjaman",
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
                  "${model.pinjamanJk}",
                ),
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
                  "${model.status}",
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: columnSize,
                child: Text(
                  "Jenis Pinjaman",
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
                  "${model.pinjamanTipe}",
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text(
                    "Total Pinjaman",
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
                    "${model.pinjamanTotal}",
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
