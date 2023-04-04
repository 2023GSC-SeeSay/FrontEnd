class PracticeModel {
  final int Pid;
  final String GifMouthUrl;
  final String GifTongueUrl;
  final int Uid;
  final String MouthDesc;
  final String TongueDesc;
  final String Text;

  PracticeModel.fromJson(Map<String, dynamic> json)
      : Pid = json['Pid'],
        GifMouthUrl = json['GifMouthUrl'],
        GifTongueUrl = json['GifTongueUrl'],
        Uid = json['Uid'],
        MouthDesc = json['MouthDesc'],
        TongueDesc = json['TongueDesc'],
        Text = json['Text'];
}
