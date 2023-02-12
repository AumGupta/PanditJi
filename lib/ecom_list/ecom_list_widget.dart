import 'package:pandit_ji/constants.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'ecom_list_model.dart';
export 'ecom_list_model.dart';
import 'package:pandit_ji/rest_api/constants.dart';

class EcomListWidget extends StatefulWidget {
  const EcomListWidget({Key? key}) : super(key: key);

  @override
  _EcomListWidgetState createState() => _EcomListWidgetState();
}

class _EcomListWidgetState extends State<EcomListWidget> {
  late EcomListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcomListModel());

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

    Widget productItem({required int id, required String imgUrl, required String name, required String quan, required int price}) {
      int count = cartItems.containsKey(id) ? cartItems[id] : 0;
      return Container(
        child: Stack(
          children: [
            Container(
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
                        '$imgUrl',
                        width: double.infinity,
                        height: 115,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                      child: Text(
                        '$name',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity $quan',
                            style: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '₹$price',
                            style: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(1, -1),
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: GestureDetector(
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
              ),
            ),
            if(count>0)
              Align(
              alignment: Alignment(1, -0.4),
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
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
              ),
            ),
            if(count>0)
              Align(
              alignment: Alignment(1, 0.2),
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      cartItems[id] = count - 1;
                    });
                  },
                  onLongPress: (){
                    setState(() {
                      cartItems[id] = 0;
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
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 40, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Let\'s Find Samagri!',
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
                        labelText: 'Search products...',
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
            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        for(final item in productData["data"]) productItem(id: item["id"], imgUrl: item["img_url"], name: item["name"], price: item["price"], quan: item["quantity"])
                      ]
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
}
