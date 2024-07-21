part of 'pinjaman_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Pinjaman model;

  final double columnSize = 120.0;
  final double valueSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              "${model.pinjamanCode}",
              style: GoogleFonts.nunito(
                fontSize: 20,
              ),
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Tanggal"),
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
                  child: Text("Lama Pinjaman"),
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
                  child: Text("Status"),
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
                  child: Text("Jenis Pinjaman"),
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
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Total Pinjaman"),
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
          ],
        ),
      ),
    );
  }
}
