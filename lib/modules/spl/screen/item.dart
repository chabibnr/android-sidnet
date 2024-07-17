part of 'spl_load_screen.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});

  final Spl model;

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
                    Text("Text 1"),
                    Text("Text 2"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
