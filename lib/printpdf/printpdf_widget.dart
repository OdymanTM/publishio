import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'printpdf_model.dart';
export 'printpdf_model.dart';

class PrintpdfWidget extends StatefulWidget {
  const PrintpdfWidget({super.key});

  @override
  State<PrintpdfWidget> createState() => _PrintpdfWidgetState();
}

class _PrintpdfWidgetState extends State<PrintpdfWidget> {
  late PrintpdfModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrintpdfModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFAppState().error,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  await actions.pdfInvoiceDownload(
                    'sdrff',
                    'rftyghuii',
                    'f55',
                    'rft5t',
                    'fftttt',
                    'ft5ttttttttf',
                    '555',
                    '55d5dt',
                    'drftygyg',
                    '[   {     \"name\": \"Product 1\",     \"units\": 2,     \"price\": 10.0,     \"totalAmount\": 20.0   },   {     \"name\": \"Product 2\",     \"units\": 1,     \"price\": 5.0,     \"totalAmount\": 5.0   },   {     \"name\": \"Product 2\",     \"units\": 1,     \"price\": 5.0,     \"totalAmount\": 5.0   },   {     \"name\": \"Product 2\",     \"units\": 1,     \"price\": 5.0,     \"totalAmount\": 5.0   },   {     \"name\": \"Product 2\",     \"units\": 1,     \"price\": 5.0,     \"totalAmount\": 5.0   },   {     \"name\": \"Product 3\",     \"units\": 3,     \"price\": 15.0,     \"totalAmount\": 45.0   } ]',
                  );
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await actions.pdfAction2(
                    'https://res.cloudinary.com/dpxrpzvry/image/upload/v1688323086/nrx5dhxceiqaqd2esxw6.png',
                  );
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await actions.pdfAction(
                    '<html>   <head>     <title>Img Src Attribute Example</title>   </head>   <body>     <img src=\"https://avatars0.githubusercontent.com/u/9892522?v=4&s=400\" />   </body> </html>',
                  );
                },
                text: 'html',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
