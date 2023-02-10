import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prompt_model.dart';
export 'prompt_model.dart';

class PromptWidget extends StatefulWidget {
  const PromptWidget({
    Key? key,
    this.go,
  }) : super(key: key);

  final String? go;

  @override
  _PromptWidgetState createState() => _PromptWidgetState();
}

class _PromptWidgetState extends State<PromptWidget> {
  late PromptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptModel());

    _model.textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFF6F9FC),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            fillColor: Color(0xFFF6F9FC),
            icon: FaIcon(
              FontAwesomeIcons.arrowCircleLeft,
              color: Color(0xFF2F485C),
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                child: Image.asset(
                  'assets/images/Cowriter_Logo.png',
                  width: 160,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('Settings');
                },
                child: Icon(
                  Icons.location_history,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 60, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Text(
                    'Whats on your heart right now?',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Text(
                    'This could be a scripture, or song, or your could even write out a prayer and I’ll suggest some themes or song ideas',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0xFFE0E3E7),
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: _model.textController,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFEE1010),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFEE1010),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 10,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: StreamBuilder<List<AiPromptsRecord>>(
                    stream: queryAiPromptsRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: Image.network(
                            '',
                          ),
                        );
                      }
                      List<AiPromptsRecord> dropDownAiPromptsRecordList =
                          snapshot.data!;
                      return FlutterFlowDropDown<String>(
                        initialOption: _model.dropDownValue ??= widget.go,
                        options: dropDownAiPromptsRecordList
                            .map((e) => e.prompt)
                            .withoutNulls
                            .toList()
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'What style of song?',
                        icon: FaIcon(
                          FontAwesomeIcons.arrowCircleDown,
                          color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.black,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      );
                    },
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('Results');
                  },
                  text: 'Generate',
                  icon: Icon(
                    Icons.auto_awesome,
                    color: Color(0xFF2F485C),
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: Color(0xFFFF7A5A),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
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
