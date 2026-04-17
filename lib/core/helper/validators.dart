class AppValidators {
  AppValidators._();

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'البريد الإلكتروني غير صالح';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 6) {
      return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
    }

    return null;
  }

  static String? validateRequiredField(
      String? value,
      String fieldName,
      ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName مطلوب';
    }

    return null;
  }

  static String? validateSaudiPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الجوال مطلوب';
    }

    final phone = value.trim();

    // المستخدم يدخل بدون 0
    final regex = RegExp(r'^5\d{8}$');

    if (!regex.hasMatch(phone)) {
      return 'رقم الجوال غير صالح';
    }

    return null;
  }

  static String? validateEnglishOnly(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    final regex = RegExp(r'^[a-zA-Z\s]+$');

    if (!regex.hasMatch(value.trim())) {
      return 'يجب إدخال حروف إنجليزية فقط';
    }

    return null;
  }
}