part of 'spl_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Spl model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Nomor"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text("${model.splNomor}"),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Tanggal SPL"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text(model.tanggalSpl),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Lama"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text("${model.splLama}"),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Keterangan"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text("${model.splKeterangan}"),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Status"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(":"),
                ),
                Text("${model.splStatus}"),
              ],
            ),
            if (model.splAlasanPenolakan != null && model.splAlasanPenolakan!.isNotEmpty)
              Container(
                width: double.infinity,
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
                    const Text("Alasan"),
                    Text("${model.splAlasanPenolakan}"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
