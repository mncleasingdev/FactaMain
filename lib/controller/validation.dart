// ignore: camel_case_types
class validationInput {
  String validateActivity(String value) {
    if (value.isEmpty) {
      return 'Activity is empty';
    }
    return null;
  }

  String validateBDS(String value) {
    if (value.isEmpty) {
      return 'Text is empty';
    }
    return null;
  }

  String validateDuration(String value) {
    if (value.isEmpty) {
      return 'Duration is empty';
    }

    final number = num.tryParse(value);
    if (number == null) {
      return 'Duration must be numeric';
    }

    return null;
  }

  String validateDesc(String value) {
    if (value.isEmpty) {
      return 'Text is empty';
    }
    return null;
  }

  String validateType(String value) {
    if (value == null) {
      return 'Type is empty';
    } else if (value == '') {
      return 'Type is empty';
    }

    return null;
  }

  String validateProduct(String value) {
    if (value == null) {
      return 'Product is empty';
    } else if (value == '') {
      return 'Product is empty';
    }
    return null;
  }

  String validateSupplier(String value) {
    if (value == null) {
      return 'Supplier is empty';
    } else if (value == '') {
      return 'Supplier is empty';
    }
    return null;
  }
}
