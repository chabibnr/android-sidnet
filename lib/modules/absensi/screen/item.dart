part of 'absensi_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Absensi model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${model.absensiHari}, ${model.tanggal}"),
                  if (model.absensiNoSpl != null) Text("${model.absensiNoSpl}"),
                  if (model.absensiLibur == true)
                    const Text(
                      'Libur',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
            if (model.hasIn)
              ListTile(
                title: const Text('Masuk'),
                subtitle: Text("${model.absensiIn}"),
                trailing: model.absensiTelat != null && model.absensiTelat!.isNotEmpty
                    ? Container(
                        decoration: const BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.all(Radius.circular(8))),
                        //padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 50,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'TELAT',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${model.absensiTelat}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            if (model.hasOut) const Divider(height: 2),
            if (model.hasOut)
              ListTile(
                title: const Text('Pulang'),
                subtitle: Text("${model.absensiOut}"),
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.red[200],
                    border: const Border.fromBorderSide(BorderSide(
                      color: Colors.red,
                    ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (model.jenisAbsensiNama != null) Text("${model.jenisAbsensiNama}"),
                    if (model.keterangan != null && model.keterangan!.isNotEmpty) Text("${model.keterangan}"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
