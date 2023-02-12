import 'package:pandit_ji/constants.dart';
import 'package:pandit_ji/rest_api/fetchUrl.dart';
import 'package:pandit_ji/rest_api/urls.dart';
import '../ecom_order_confirmed/ecom_order_confirmed_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'ecom_checkout_model.dart';
export 'ecom_checkout_model.dart';
import 'package:pandit_ji/rest_api/constants.dart';


class EcomCheckoutWidget extends StatefulWidget {
  const EcomCheckoutWidget({Key? key}) : super(key: key);

  @override
  _EcomCheckoutWidgetState createState() => _EcomCheckoutWidgetState();
}

class _EcomCheckoutWidgetState extends State<EcomCheckoutWidget> {
  late EcomCheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(cartItems);
    _model = createModel(context, () => EcomCheckoutModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int totalPrice = 0;

    for (final item in productData["data"]) {
      final int id = item["id"];
      final int price = item["price"];
      int count = cartItems.containsKey(id) ? cartItems[id] : 0;
      totalPrice += count * price;
    }

    Widget productItem({required int id, required String imgUrl, required String name, required String quan, required int price}) {
      int count = cartItems.containsKey(id) ? cartItems[id] : 0;
      if (count < 1) {
        return Container();
      }
      return Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.96,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3A000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '$imgUrl',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$name',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Text(
                                    '₹$price',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            cartItems[id] = count + 1;
                                          });
                                          print(count);
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(child: Icon(Icons.add, color: FlutterFlowTheme.of(context).primaryColor,)),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "$count",
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      if (count > 0)
                                        GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            cartItems[id] = count - 1;
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Icon(Icons.remove, color: FlutterFlowTheme.of(context).primaryColor,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'My Cart',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x4814181B),
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Total',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            Text(
                              '₹$totalPrice',
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for(final item in productData["data"]) productItem(id: item["id"], imgUrl: item["img_url"], name: item["name"], price: item["price"], quan: item["quantity"]),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x3A000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  Text(
                                    '₹$totalPrice',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tax',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  Text(
                                    '₹0',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  Text(
                                    '₹0',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  Text(
                                    '₹$totalPrice',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context).title2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x430F1113),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
              child: FFButtonWidget(
                onPressed: totalPrice == 0 ? null : () async{
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EcomOrderConfirmedWidget()),
                  );
                },
                text: 'Checkout',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
