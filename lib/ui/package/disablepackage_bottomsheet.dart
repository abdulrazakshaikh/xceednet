import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/utils/AppUtils.dart';

import '../../view_model/package_view_model.dart';

class DisablePackageBottomSheet extends StatefulWidget {
  String status;
  String packageId;
  Function updateDetail;

  DisablePackageBottomSheet(this.packageId, this.status, this.updateDetail);

  @override
  _DisablePackageBottomSheetState createState() =>
      _DisablePackageBottomSheetState();
}

class _DisablePackageBottomSheetState extends State<DisablePackageBottomSheet>
    with TickerProviderStateMixin {
  TextEditingController noteController = TextEditingController();
  late PackageViewModel packageViewModel;

  @override
  Widget build(BuildContext context) {
    packageViewModel = context.watch<PackageViewModel>();
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.status,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Comment',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: noteController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLines: 4,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Enter Comment'.toLowerCase(),
                            hintStyle: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: packageViewModel.isUpdateLoading
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      Container(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text(
                            'Cancel',
                          ),
                        ),
                ),
                SizedBox(width: 10),
                Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (widget.status == "Delete Package") {
                              bool a = await packageViewModel
                                  .deletePackage(widget.packageId, {});
                              if (a) {
                                packageViewModel.getPackageDetailData(
                                    packageId: widget.packageId);
                                AppUtils.appToast("Package Delete");
                                widget.updateDetail();
                                Navigator.pop(context);
                              } else {
                                AppUtils.appToast(
                                    "Failed to update : ${packageViewModel.error}");
                              }
                            } else {
                              String s = "";
                              if (widget.status == "Publish Package") {
                                s = 'publish';
                              } else if (widget.status == "Unpublish Package") {
                                s = 'unpublish';
                              } else if (widget.status == "Disable Package") {
                                s = 'disable';
                              } else if (widget.status == "Enable Package") {
                                s = 'enable';
                              }
                              bool a = await packageViewModel
                                  .updatePackage(widget.packageId, {
                                "status_event": s,
                              });
                              if (a) {
                                packageViewModel.getPackageDetailData(
                                    packageId: widget.packageId);
                                AppUtils.appToast("Package Updated");
                                Navigator.pop(context);
                              } else {
                                AppUtils.appToast(
                                    "Failed to update : ${packageViewModel.error}");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text(widget.status),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
