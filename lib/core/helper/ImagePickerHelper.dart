import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sas_go/core/constants/app_strings.dart';
import '../theme/text_styles.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImage(BuildContext context) async {
    return showModalBottomSheet<File?>(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt, size: 32),
                  title: Text(
                    AppStrings.camera,
                    style: TextStyles.font16DarkBlueSemiBold,
                  ),
                  onTap: () async {
                    final file = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (!context.mounted) return;
                    Navigator.pop(
                      context,
                      file != null ? File(file.path) : null,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo, size: 32),
                  title: Text(
                    AppStrings.gallery,
                    style: TextStyles.font16DarkBlueSemiBold,
                  ),
                  onTap: () async {
                    final file = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (!context.mounted) return;
                    Navigator.pop(
                      context,
                      file != null ? File(file.path) : null,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
