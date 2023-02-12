import 'package:pandit_ji/constants.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget>
    with TickerProviderStateMixin {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
        ),
        title: Text(
          ' ',
          style: FlutterFlowTheme.of(context).subtitle2.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF151B1E),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
        //     child: FlutterFlowIconButton(
        //       borderColor: Colors.transparent,
        //       borderRadius: 30,
        //       buttonSize: 48,
        //       icon: Icon(
        //         Icons.shopping_cart_outlined,
        //         color: FlutterFlowTheme.of(context).secondaryText,
        //         size: 30,
        //       ),
        //       onPressed: () async {
        //         context.pushNamed(
        //           'cart',
        //           extra: <String, dynamic>{
        //             kTransitionInfoKey: TransitionInfo(
        //               hasTransition: true,
        //               transitionType: PageTransitionType.bottomToTop,
        //               duration: Duration(milliseconds: 200),
        //             ),
        //           },
        //         );
        //       },
        //     ),
        //   ),
        // ],ns: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
        //     child: FlutterFlowIconButton(
        //       borderColor: Colors.transparent,
        //       borderRadius: 30,
        //       buttonSize: 48,
        //       icon: Icon(
        //         Icons.shopping_cart_outlined,
        //         color: FlutterFlowTheme.of(context).secondaryText,
        //         size: 30,
        //       ),
        //       onPressed: () async {
        //         context.pushNamed(
        //           'cart',
        //           extra: <String, dynamic>{
        //             kTransitionInfoKey: TransitionInfo(
        //               hasTransition: true,
        //               transitionType: PageTransitionType.bottomToTop,
        //               duration: Duration(milliseconds: 200),
        //             ),
        //           },
        //         );
        //       },
        //     ),
        //   ),
        // ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Hero(
                      tag: 'mainImage',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c639068c-ee02-493b-83a1-630885f45fb0/therma-mens-full-zip-training-hoodie-DwfKtF.png',
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: kBackgroundTint,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Product Name',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'Details',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'Cost',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              '₹100 for 150gm',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3C0F1113),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 40),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('ServiceCheckout');
                  },
                  text: 'Book Now',
                  options: FFButtonOptions(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
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
