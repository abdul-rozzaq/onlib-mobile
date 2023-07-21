import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<CAppBar> createState() => _CAppBarState();
}

class _CAppBarState extends State<CAppBar> {
  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  final _aspectTolerance = 0.00;
  final _selectedCamera = -1;
  final _useAutoFocus = true;
  final _autoEnableFlash = false;

  bool searchMode = false;

  TextEditingController searchInputController = TextEditingController();
  ScanResult? scanResult;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: !searchMode
          ? []
          : [
              IconButton(
                onPressed: _scan,
                icon: const Icon(
                  Icons.qr_code_rounded,
                  color: Colors.black87,
                ),
              ),
            ],
      elevation: 0,
      leading: !searchMode
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                color: Colors.green.shade400,
              ),
            )
          : IconButton(
              onPressed: () {
                setState(() => searchMode = !searchMode);
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
              ),
            ),
      title: CupertinoTextField(
        onTap: () {
          setState(() => searchMode = !searchMode);
        },
        controller: searchInputController,
        style: const TextStyle(fontFamily: 'Lobster'),
        placeholder: "Search ...",
      ),
      // centerTitle: true,
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          // restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() => scanResult = result);

      searchInputController.text = result.rawContent;
    } on PlatformException catch (e) {
      setState(
        () {
          scanResult = ScanResult(
            type: ResultType.Error,
            rawContent: e.code == BarcodeScanner.cameraAccessDenied
                ? 'The user did not grant the camera permission!'
                : 'Unknown error: $e',
          );
        },
      );
    }
  }
}
