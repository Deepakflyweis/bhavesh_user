import 'package:contacts_service/contacts_service.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';

// class ContactScreen extends StatefulWidget {
//   const ContactScreen({Key? key}) : super(key: key);

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {
//   Iterable<Contact>? _contacts;
//   BookVehicleController _controller = Get.put(BookVehicleController());

//   @override
//   void initState() {
//     getContacts();
//     super.initState();
//   }

//   Future<void> getContacts() async {
//     //Make sure we already have permissions for contacts when we get to this
//     //page, so we can just retrieve it
//     final Iterable<Contact> contacts = await ContactsService.getContacts();
//     setState(() {
//       _contacts = contacts;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts'),
//         centerTitle: true,
//       ),
//       body: _contacts != null
//           ? ListView.builder(
//               itemCount: _contacts!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Contact contact = _contacts!.elementAt(index);
//                 return ListTile(
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
//                   leading: (contact.avatar != null &&
//                           contact.avatar!.isNotEmpty)
//                       ? const CircleAvatar(
//                           child: Icon(Icons.supervised_user_circle_sharp),
//                         )
//                       : CircleAvatar(
//                           child: Text(contact.initials()),
//                           backgroundColor: Theme.of(context).backgroundColor,
//                         ),
//                   title: Text(contact.displayName ?? ''),
//                   //This can be further expanded to showing contacts detail
//                   onTap: () {
//                     if (contact.givenName!.isNotEmpty) {
//                       _controller.senderName.text = _contacts.first;
//                       setState(() {
//                         Get.back();
//                       });
//                     }
//                   },
//                 );
//               },
//             )
//           : Center(child: const CircularProgressIndicator()),
//     );
//   }
// }


class SelectionDialogContacts extends StatefulWidget {
  final List<Contact> elements;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;

  /// elements passed as favorite
  final List<Contact> favoriteElements;

  SelectionDialogContacts(this.elements, this.favoriteElements, {
    Key ? key,
    required this.showCountryOnly,
    required this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    required this.searchStyle,
  }) :
        this.searchDecoration = searchDecoration.copyWith(prefixIcon: Icon(Icons.search)),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialogContacts> {
  // / this is useful for filtering purpose
    List<Contact> ? filteredElements;

  @override
  Widget build(BuildContext context) => SimpleDialog(
    title: Column(
      children: <Widget>[
        TextField(
          style: widget.searchStyle,
          decoration: widget.searchDecoration,
          onChanged: _filterElements,
        ),
      ],
    ),
    children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              children: [
                widget.favoriteElements.isEmpty
                    ? const DecoratedBox(decoration: BoxDecoration())
                    : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[]
                      ..addAll(widget.favoriteElements
                          .map(
                            (f) => SimpleDialogOption(
                          child: _buildOption(f),
                          onPressed: () {
                            _selectItem(f);
                          },
                        ),
                      )
                          .toList())
                      ..add(const Divider())),
              ]..addAll(filteredElements!.isEmpty
                  ? [_buildEmptySearchWidget (context)]
                  : filteredElements!.map(
                      (e) => SimpleDialogOption(
                    // key: Key(e.displayName),
                    child: _buildOption(e),
                    onPressed: () {
                      _selectItem(e);
                    },
                  )))
          )
      ),
    ],
  );

  Widget _buildOption(Contact e) {
    return Container(
      width: 400,
      child: Row(
        //direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: (e.avatar != null && e.avatar!.isNotEmpty)
                ? const CircleAvatar(child: Icon(Icons.supervised_user_circle_sharp),)
                : CircleAvatar(child: Text(e.initials())),
          ),
          const SizedBox(width: 15.0),
          // Expanded(
          //   flex: 4,
          //   child:
          //   //  Text(
          //   //   e.middleName,
          //   //   overflow: TextOverflow.fade,
          //   // ),
          // ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder(context);
    }

    return const Center(child: Text('no contacts'));
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
          e.displayName!.contains(s))
          .toList();
    });
  }

  void _selectItem(Contact e) {
    Navigator.pop(context, e);
  }
}