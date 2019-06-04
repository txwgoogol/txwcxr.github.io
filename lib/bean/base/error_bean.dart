class ErrorBean {
  String errorMessage;
  String errorCode;
  List<String> errorArgs;
  int status;

  ErrorBean({this.errorMessage, this.errorCode, this.errorArgs, this.status});

  ErrorBean.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    errorArgs = json['errorArgs'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMessage'] = this.errorMessage;
    data['errorCode'] = this.errorCode;
    data['errorArgs'] = this.errorArgs;
    data['status'] = this.status;
    return data;
  }
}
