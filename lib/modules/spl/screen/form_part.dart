import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/spl/bloc/spl_add/spl_add_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormPart extends StatelessWidget {
  const FormPart({
    super.key,
    required this.isLoading,
    required this.model,
    required this.formKey,
  });

  final bool isLoading;
  final Spl model;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderDateTimePicker(
            name: 'spl_tgl_spl',
            initialValue: model.dateSpl,
            format: DateFormat('EEEE, d MMMM y', 'ID'),
            decoration: CustomInputDecoration().floating('Tanggal').copyWith(
                  suffixIcon: const Icon(Icons.date_range_rounded),
                  hintText: "Tanggal Lembur",
                ),
            inputType: InputType.date,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderDateTimePicker(
            name: 'spl_lama',
            decoration: CustomInputDecoration().floating('Durasi Lembur').copyWith(
                  suffixIcon: const Icon(Icons.more_time),
                  hintText: "Berapa jam lembur yang dilakukan",
                ),
            inputType: InputType.time,
            initialTime: const TimeOfDay(hour: 1, minute: 0),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.only(top: 20),
          child: FormBuilderTextField(
            name: 'spl_keterangan',
            initialValue: model.splKeterangan,
            minLines: 5,
            maxLines: 8,
            decoration: CustomInputDecoration().floating('Keterangan').copyWith(
                  hintText: "Deskripsikan pekerjaan yang akan dilakukan.",
                ),
            validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
          icon: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              : const Icon(Icons.send),
          onPressed: isLoading
              ? null
              : () {
                  context.read<SplAddCubit>().execute();
                },
          label: Text(
            isLoading ? 'Mengirim pengajuan...' : 'Kirim Pengajuan Lembut',
            style: GoogleFonts.nunito(
              fontSize: 18,
            ),
          ),
        ),
      ]),
    );
  }
}
