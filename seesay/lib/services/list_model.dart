class ListModel {
  final int Pid;
  final String Text;
  final int Uid;

  ListModel.fromJson(Map<String, dynamic> json)
      : Pid = json['Pid'],
        Uid = json['Uid'],
        Text = json['Text'];
}
