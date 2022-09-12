import 'package:flutter/material.dart';
import 'package:mars_case/widgets/custom_appbar.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar(title: 'Notes'),
    );
  }
}


// Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Card(
//             child: SizedBox(
//               height: context.dynamicHeight(0.1),
//               width: context.dynamicWidth(0.8),
//               child: Row(
//                 children: [
//                   SizedBox(
//                       height: context.dynamicHeight(0.1), width: context.dynamicWidth(0.1), child: const Placeholder()),
//                   Column(
//                     children: const [Text('data'), Text('data')],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         )