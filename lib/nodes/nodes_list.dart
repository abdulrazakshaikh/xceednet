import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/nodes/node_add.dart';
import 'package:xceednet/nodes/nodes_details.dart';

class NodesList extends StatefulWidget {



  
  @override
  State<NodesList> createState() => _NodesListState();
}

class _NodesListState extends State<NodesList> {

  List subscribersList = [
    {
      "id": "101",
      "status" : "Assigned",

      "name" : "John Doe",
      "mobile" : "9876543210",

      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",

      "ticket" : "-",

    },
    {
      "id": "102",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },
    {
      "id": "103",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },{
      "id": "103",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },{
      "id": "103",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },{
      "id": "103",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },{
      "id": "103",
      "name" : "John Doe",
      "mobile" : "9876543210",
      "createdon" : "01 Sep, 2022",
      "assignedto" : "Johnson Doe",
      "ticket" : "-",
      "status" : "Assigned",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        
        title: Text("Nodes"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: NodeAdd()
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
                itemCount: subscribersList == null ? 0 : subscribersList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  Map item = subscribersList[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                                  opacity: animation,
                                  child: NodesDetails()
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
                                      Text('Map Position : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('Location Position',
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
                                      Text('# of Subscribers : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('1,00,000',
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
