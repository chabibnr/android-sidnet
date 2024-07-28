part of 'spl_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Spl model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ColorSchema.primaryColor],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  "Nomor",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              SizedBox(
                width: 100,
                child: Text(
                  "Tanggal SPL",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              SizedBox(
                width: 100,
                child: Text(
                  "Lama",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              SizedBox(
                width: 100,
                child: Text(
                  "Keterangan",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              SizedBox(
                width: 100,
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
    );
  }
}
