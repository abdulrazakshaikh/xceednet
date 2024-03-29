import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/invoice/invoice_add.dart';
import 'package:xceednet/invoice/invoice_details.dart';
import 'package:xceednet/leads/leads_add.dart';
import 'package:xceednet/leads/leads_details.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/subscribers/subscribers_details.dart';

class InvoicesList extends StatefulWidget {



  
  @override
  State<InvoicesList> createState() => _InvoicesListState();
}

class _InvoicesListState extends State<InvoicesList> {

List invoicesList = [
  {
    "id": "101",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "open",
  },
  {
    "id": "102",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "assigned",
  },
  {
    "id": "103",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "closed",
  },
  {
    "id": "104",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "reopen",
  },
  {
    "id": "105",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "open",
  },
  {
    "id": "106",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "cancelled",
  },
  {
    "id": "107",
    "username" : "johndoe1545",
    "name" : "John Doe",
    "invoicedate" : "01 Sep, 2022",
    "assignedto" : "Johnson Singh",
    "dueby" : "30 Sep, 2022",
    "amountbeforetax" : "500",
    "totalbalance" : "500",
    "status" : "closed",
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Invoices"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: InvoiceAdd()
                  ),
                ),
              );
            }, 
            icon: Icon(Icons.add), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              foregroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: Size(54, 54),
              fixedSize: Size(54, 54),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HeadToolbar(),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView.separated(

                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: invoicesList == null ? 0 : invoicesList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  Map item = invoicesList[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                                  opacity: animation,
                                  child: InvoiceDetails()
                              ),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                                )
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Invoice ID : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["id"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Username : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["username"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["name"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Invoice Date : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["invoicedate"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Assigned To : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["assignedto"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Due By: '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["dueby"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Amount Before Tax : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('₹${item["amountbeforetax"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Total Balance : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('₹${item["totalbalance"]}',
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Status : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(width: 3),
                                      Text('${item["status"]}',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.bodyMedium,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: 
                                        item["status"] == "open" ?
                                        Colors.blue
                                        :
                                        item["status"] == "assigned" ?
                                        Colors.deepPurple                                    
                                        :
                                        item["status"] == "reassigned" ?
                                        Colors.deepPurple
                                        :
                                        item["status"] == "rejected" ?
                                        Colors.red
                                        :
                                        item["status"] == "pending" ?
                                        Colors.orange
                                        :
                                        item["status"] == "inprocess" ?
                                        Colors.blue
                                        :
                                        item["status"] == "cancelled" ?
                                        Colors.red
                                        :
                                        item["status"] == "resolved" ?
                                        Colors.green
                                        :
                                        item["status"] == "reopened" ?
                                        Colors.blue
                                        :
                                        item["status"] == "closed" ?
                                        Colors.green
                                        :
                                        null,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
        
        ],
      ),
    );
  }
}
