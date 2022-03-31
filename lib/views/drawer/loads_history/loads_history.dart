import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/drawer/loads_history/loads_history_details.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/load_history_tile.dart';

class LoadsHistory extends StatelessWidget {
  const LoadsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrawerAppBar(title: 'Loads History'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('ALL'), Icon(Icons.filter_list_outlined)],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => LoadsHistoryTile()),
          )
        ],
      ),
    );
  }
}
