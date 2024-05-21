class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(
      Map<String, dynamic>
          json) // json 데이터 구조를 Map<String, dynamic> 데이터 타입으로 변경
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id']; // 받은 데이터들로 초기화
}
