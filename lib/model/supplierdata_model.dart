class SupplierDataModel {
  String masterSupplierId;
  String supplierName;
  String supplierAddr;
  String supplierCp;
  String supplierCpPhone;
  String supplierCp2;
  String supplierCpPhone2;
  String isActive;

  SupplierDataModel(
      {this.masterSupplierId,
      this.supplierName,
      this.supplierAddr,
      this.supplierCp,
      this.supplierCpPhone,
      this.supplierCp2,
      this.supplierCpPhone2,
      this.isActive});

  factory SupplierDataModel.createSupp(Map<String, dynamic> object) {
    return SupplierDataModel(
      masterSupplierId: object['master_supplier_id'].toString(),
      supplierName: object['supplier_name'],
      supplierAddr: object['supplier_addr'],
      supplierCp: object['supplier_cp'],
      supplierCpPhone: object['supplier_cp_phone'],
      supplierCp2: object['supplier_cp_2'],
      supplierCpPhone2: object['supplier_cp_phone_2'],
      isActive: object['is_active'],
    );
  }
}
