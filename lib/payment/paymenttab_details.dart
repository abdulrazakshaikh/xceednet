import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTabDetails extends StatefulWidget {
  @override
  _PaymentTabDetailsState createState() => new _PaymentTabDetailsState();
}

class _PaymentTabDetailsState extends State<PaymentTabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "Payment ID",
    "value" : "#12346579"
  },
  {
    "id": "002",
    "label" : "Payment Date",
    "value" : "23-Sep-2022"
  },
  {
    "id": "003",
    "label" : "Description",
    "value" : "lorem uo]dnsjkhdsllsa jlalsldsaulojelpoq;asfdposajlsdjlk lpsaopidadsplajl"
  },
  {
    "id": "004",
    "label" : "Amount",
    "value" : "₹500"
  },
  {
    "id": "005",
    "label" : "Mode of Payment",
    "value" : "Cash"
  },
  {
    "id": "006",
    "label" : "Receipt Number",
    "value" : "REC56564564"
  },
  {
    "id": "007",
    "label" : "Received by",
    "value" : "Dipesh Jain"
  },
];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
        padding: EdgeInsets.all(15),
        child: ListView.separated(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: detailsList == null ? 0 : detailsList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
          itemBuilder: (BuildContext context, int index) {
            Map item = detailsList[index];
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 35,
                    child: Text('${item["label"]} : ',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelMedium,
                      letterSpacing: 1.5
                    ),
                  ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 65,
                    child: Text('${item["value"]}',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  )
                ],
              ),
            );
          }
        ),
        ),
      ],
    );   
  }
}