import 'dart:developer';

import 'package:pandit_ji/constants.dart';
import 'package:pandit_ji/ecom_checkout/ecom_checkout_widget.dart';
import 'package:pandit_ji/ecom_list/ecom_list_widget.dart';
import 'package:pandit_ji/profile/profile_widget.dart';
import 'package:pandit_ji/service_details/service_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:pandit_ji/rest_api/constants.dart';

int _selectedNavIndex = 0;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    _model.textController = TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(servicesData["data"].toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: _selectedNavIndex != 1 ? null : FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EcomCheckoutWidget()),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        child: Icon(Icons.shopping_cart_sharp, color: Colors.white,),
      ),
      body: _selectedNavIndex == 1 ? EcomListWidget() : _selectedNavIndex == 2 ? ProfileWidget() : SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Namaste,',
                                  style: FlutterFlowTheme.of(context).title3.override(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    'ASTRA',
                                    style: FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  color: kBackgroundTint,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_rounded, color: FlutterFlowTheme.of(context).primaryColor,),
                                    Text(
                                      "Delhi",
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context).primaryColor
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 40, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Let\'s Find Your Service!',
                        style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                                () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search services...',
                            labelStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: kBackgroundTint,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Color(0xFF57636C),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF14181B),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: null,
                          validator:
                          _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.filter_list_alt),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      for(final item in servicesData["data"]) ServiceCard(info: item)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 40, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Bookings',
                        style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See All',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF14181B),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 10),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                'https://content.jdmagicbox.com/comp/bangalore/f6/080pxx80.xx80.210608165926.m3f6/catalogue/shastriya-pooja-malleswaram-bangalore-pandits-k3s4w9d1cw.jpg',
                                width: 90,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ram Shastri',
                                  style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Maha Shivratri Puja',
                                  style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.white,),
                                    Text(
                                      '4.5',
                                      style: FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.6)),
                              SizedBox(width: 10),
                              Text(
                                '15 Feb 2023, 2 pm',
                                style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
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
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: FlutterFlowTheme.of(context).primaryColor,
        index: 0,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.local_mall, size: 30),
          Icon(Icons.account_circle, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.info}) : super(key: key);
  final info;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedService = info;
        context.pushNamed("ServiceDetails");
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 190,
          decoration: BoxDecoration(
            color: kBackgroundTint,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x230E151B),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${info["img_url"]}",
                    width: double.infinity,
                    height: 115,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                  child: Text(
                    '${info["name"]}',
                    style: FlutterFlowTheme.of(context)
                        .subtitle1
                        .override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF14181B),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    '₹${info["price"]}',
                    style: FlutterFlowTheme.of(context)
                        .bodyText2
                        .override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF57636C),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

