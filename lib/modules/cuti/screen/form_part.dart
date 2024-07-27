import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/cuti/bloc/cuti_add/cuti_add_cubit.dart';
import 'package:app/modules/cuti/model/cuti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormPart extends StatelessWidget {
  const FormPart({
    super.key,
    required this.isUpdate,
    required this.isLoading,
    required this.model,
    required this.formKey,
    required this.jenisCuti,
  });

  final bool isLoading;
  final bool isUpdate;
  final Cuti model;
  final List<dynamic> jenisCuti;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderDropdown(
            name: 'jenis_absensi_id',
            initialValue: model.jenisAbsensiId,
            decoration: CustomInputDecoration().floating('Pilih Keperluan'),
            items: List.generate(jenisCuti.length, (index) {
              return DropdownMenuItem(
                value: jenisCuti[index]['jenis_absensi_id'],
                child: Text('${jenisCuti[index]['jenis_absensi_nama']}'),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderDateTimePicker(
            name: 'cuti_dari',
            initialValue: model.cutiTanggalMulai,
            format: DateFormat('EEEE, d MMMM y', 'ID'),
            decoration: CustomInputDecoration().floating('Mulai').copyWith(
                  suffixIcon: const Icon(Icons.date_range_rounded),
                  hintText: "Tanggal Mulai",
                ),
            inputType: InputType.date,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderDateTimePicker(
            name: 'cuti_sampai',
            initialValue: model.cutiTanggalSampai,
            format: DateFormat('EEEE, d MMMM y', 'ID'),
            decoration: CustomInputDecoration().floating('Sampai').copyWith(
                  suffixIcon: const Icon(Icons.date_range_rounded),
                  hintText: "Tanggal Sampai",
                ),
            inputType: InputType.date,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderTextField(
            name: 'cuti_keperluan',
            minLines: 2,
            maxLines: 3,
            initialValue: model.cutiKeperluan,
            decoration: CustomInputDecoration().floating('Keperluan').copyWith(hintText: 'Deskripsikan keperluan kamu.'),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderFilePicker(
            name: "cuti_bukti",
            decoration: CustomInputDecoration().floating('Bukti'),
            //maxFiles: 1,
            allowMultiple: false,
            previewImages: true,
            onChanged: (val) => print(val),
            typeSelectors: const [
              TypeSelector(
                type: FileType.any,
                selector: Row(
                  children: <Widget>[
                    Icon(Icons.add_circle),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("tambahkan dokumen bukti"),
                    ),
                  ],
                ),
              ),
            ],
            onFileLoading: (val) {
              print(val);
            },
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          icon: const Icon(Icons.send),
          onPressed: () {
            context.read<CutiAddCubit>().execute();
          },
          label: Text(
            '${isUpdate ? 'Update' : 'Kirim'} Pengajuan Cuti',
            style: GoogleFonts.nunito(
              fontSize: 18,
            ),
          ),
        ),
      ]),
    );
  }
}
