part of 'gaji_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Gaji model;
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
              "${model.gajiPeriode}",
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Gaji Pokok"),
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
                  child: Text("Gaji Kotor"),
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
                  child: Text("Total Potongan"),
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
                  child: Text("Gaji Bersih"),
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
