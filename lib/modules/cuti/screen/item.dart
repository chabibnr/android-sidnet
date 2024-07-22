part of 'cuti_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Cuti model;
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
              "${model.cutiNomor}",
              style: GoogleFonts.nunito(
                fontSize: 20,
              ),
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: columnSize,
                  child: Text("Diajukan Pada"),
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
                  child: Text("Periode Tgl."),
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
                  child: Text("Keperluan"),
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
                  child: Text("Status"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                SizedBox(
                  width: valueSize,
                  child: Text(
                    "${model.cutiStatus}",
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
                    color: Colors.red[200],
                    border: const Border.fromBorderSide(BorderSide(
                      color: Colors.red,
                    ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${model.cutiAlasanPenolakan}"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
