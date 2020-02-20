import 'package:flutter/material.dart';
import 'swag_page.dart';
import '../globals.dart';
import '../util/inputs.dart';

class MembershipPage extends StatefulWidget {
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  bool _isNewMember = true;
  final Map<String, String> _radioInputs = {
    'membershipType': 'Premium 4 Year',
    'jacketStyle': 'Male',
    'jacketSize': 'L',
    'sportsFormat': 'Digital',
  };

  Widget _radioGroup({List<String> titles, @required List<String> values, @required String name, bool column = false}) {
    if (titles == null) {
      titles = values;
    } else {
      assert(titles.length == values.length);
    }

    List<Widget> list = [];
    for (int i = 0; i < titles.length; i++) {
      list.add(Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: LabeledInput(
          title: titles[i],
          noPadding: true,
          input: Radio(
            value: values[i],
            groupValue: _radioInputs[name],
            onChanged: (val) {
              setState(() {
                _radioInputs[name] = val;
              });
            },
          ),
        ),
      ));
    }

    return column ? Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: list,
    ) : Row(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            LabeledInput(
              title: 'New member?',
              input: Checkbox(
                value: _isNewMember,
                onChanged: (val) {
                  setState(() {
                    _isNewMember = val;
                  });
                },
              ),
            ),
            LabeledInput(
              title: 'Membership Type',
              input: _radioGroup(
                name: 'membershipType',
                column: true,
                titles: ['Premium 4 Year - \$500', 'Deluxe Family - \$225', 'Basic Family - \$130', 'Young Alumni - \$50'],
                values: ['Premium 4 Year', 'Deluxe Family', 'Basic Family', 'Young Alumni'],
              ),
            ),
            LabeledInput(
              title: 'Jacket Style',
              input: _radioGroup(
                name: 'jacketStyle',
                values: ['Male', 'Female'],
              ),
            ),
            LabeledInput(
              title: 'Jacket Size',
              input: _radioGroup(
                name: 'jacketSize',
                values: ['S', 'M', 'L', 'XL', 'XXL', 'XXXL']
              ),
            ),
            LabeledInput(
              title: 'Sports Program Format',
              input: _radioGroup(
                name: 'sportsFormat',
                values: ['Digital', 'Printed']
              ),
            ),
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                sheetRow.isNewMember = _isNewMember;
                sheetRow.membershipType = _radioInputs['membershipType'];
                sheetRow.jacketStyle = _radioInputs['jacketStyle'];
                sheetRow.jacketSize = _radioInputs['jacketSize'];
                sheetRow.sportsFormat = _radioInputs['sportsFormat'];
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SwagPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}