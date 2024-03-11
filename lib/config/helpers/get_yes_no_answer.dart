import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_models.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // esto sale del models para mapear los datos
    final yesNoModels = YesNoModels.fromJsonMap(response.data);

    return yesNoModels.toMessageEntity();
  }
}
