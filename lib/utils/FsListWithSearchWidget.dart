import 'package:flutter/material.dart';
//import 'package:sso_futurescape/ui/module/meeting/utils/grocery_ui_utils.dart';

class FsListWithSearchWidget extends StatefulWidget {
  var pageLoadListner;
  Function? afterView;
  var itemBuilder;
  var message;
  Widget? errorWidget;
  var title;
  bool? showError = true;

  FsListWithSearchWidget(
      {this.pageLoadListner,
      this.afterView,
      this.itemBuilder,
      this.title,
      this.message,
      this.showError,
      this.errorWidget});

  @override
  State<StatefulWidget> createState() {
    return FsListWithSearchState(
        pageLoadListner: pageLoadListner,
        afterView: afterView!,
        itemBuilder: itemBuilder,
        title: title,
        message: message,
        showError: showError,
        errorWidget: errorWidget);
  }
}

class FsListWithSearchState extends State<FsListWithSearchWidget> {
  PageLoadSearchListener? pageLoadListner;
  Function afterView;

  Function? itemBuilder;

  var title;

  var message;
  bool? showError = true;

  @override
  initState() {
    _scrollController.addListener(() {
      // print("ssssssssssssssss");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (metadata['total_item_count'] != null) {
          if (metadata['total_item_count'] == receiptList!.length) {
            return;
          }
        }
        print("metadata");
        print(metadata);
        if (metadata == null ||
            metadata['last_page'] != metadata['current_page']) {
          print("page no " + metadata.toString());
          String pageNumber =
              metadata == null || metadata['current_page'].toString() == null
                  ? '1'
                  : (metadata['current_page'] + 1).toString();
          print("object  $pageNumber");
          loadMore(pageNumber);
        }
      }
    });
    super.initState();
  }

  FsListWithSearchState(
      {this.pageLoadListner,
      required this.afterView,
      this.itemBuilder,
      this.title,
      this.message,
      this.showError,
      this.errorWidget}) {
    afterView(this);
  }

  Widget? errorWidget;
  ScrollController _scrollController =
      ScrollController(keepScrollOffset: false);
  List? receiptList = null;

  var metadata;
  int? unit_id;

  void loadMore(String pageNumber) {
    pageLoadListner!.loadNextPage(pageNumber);
  }

//  Widget _getShimmeringStoreListLoaderWidget() {
//     return GroceryUiUtils.getShimmeringStoreListWidget();
//   }
  @override
  Widget build(BuildContext context) {
    return receiptList == null
        ? Container(
            margin: EdgeInsets.only(top: 100),
            child: CircularProgressIndicator())
        //  ? _getShimmeringStoreListLoaderWidget()
        : receiptList!.length == 0
            ? (showError!
                ? Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text("No search record found"))
                : Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text("No search record found")))
            : ListView.separated(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                controller: _scrollController,
                itemCount: receiptList == null ? 0 : receiptList!.length,
                itemBuilder: (BuildContext context, int index) {
                  /* Padding childItem = getChildItem(index);*/
                  print("receiptList ${receiptList!.length}");
                  var childItem =
                      itemBuilder!(context, index, receiptList![index]);
                  return childItem;
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
              );
  }

  void clearList() {
    receiptList!.clear();
  }

  void clearAllState() {
    receiptList!.clear();
    receiptList = null;
    metadata = null;
    try {
//      _scrollController.dispose();
    } catch (e) {}
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void setErrorWidget(Widget errorWidget) {
    this.errorWidget = errorWidget;
  }

  void addListList(metadata, receiptList) {
    //print(receiptList);
    if (this.receiptList == null) {
      this.receiptList = [];
    }
    this.metadata = metadata;
    /*if (receiptList == null || receiptList.length == 0) {
      this.receiptList!.clear();
    } else {

    }*/
    this.receiptList!.addAll(receiptList);
    setState(() {});
  }

  void notItems() {
    if (metadata == null) {
      this.receiptList = null;
    }
    setState(() {});
  }

  void stateUpdate() {
    setState(() {});
  }

  void setLoading(bool isLoading) {
    if (!isLoading) {
      if (receiptList == null) {
        receiptList = [];
      }
    } else {}
  }
}

abstract class PageLoadSearchListener {
  loadNextPage(String page);

  lastPage(int page);
}