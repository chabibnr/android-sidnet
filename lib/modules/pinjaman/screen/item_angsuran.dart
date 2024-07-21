part of 'pinjaman_view_screen.dart';

class ItemAngsuran extends StatelessWidget {
  const ItemAngsuran({super.key, required this.model});

  final Angsuran model;

  final double columnSize = 120.0;
  final double valueSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Angsuran Ke"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.angsurKe}",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Tempo"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text(model.tanggalTempo),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Angsuran Pokok"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.angsurPokok}",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Bunga"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.angsurBunga}",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("SKA"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.angsurSka}",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Status"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text(
                  model.isComplete ? "DIBAYAR" : "BELUM DIBAYAR",
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: model.isComplete ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            if (model.isComplete)
              Row(
                children: [
                  SizedBox(
                    width: columnSize,
                    child: const Text("Tanggal Bayar"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(":"),
                  ),
                  Text(model.tanggalBayar),
                ],
              ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Total Angsuran"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.angsurTotal}",
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: model.isComplete ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
