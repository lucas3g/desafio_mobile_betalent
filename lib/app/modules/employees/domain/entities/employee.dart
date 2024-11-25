import '../../../../core/domain/vos/date_time_vo.dart';
import '../../../../core/domain/vos/id_vo.dart';
import '../../../../core/domain/vos/text_vo.dart';

class Employee {
  IdVO _id;
  TextVO _name;
  TextVO _job;
  DateTimeVO _admissionDate;
  TextVO _phone;
  TextVO _image;

  IdVO get id => _id;
  void setId(int value) => _id = IdVO(value);

  TextVO get name => _name;
  void setName(String value) => _name = TextVO(value);

  TextVO get job => _job;
  void setJob(String value) => _job = TextVO(value);

  DateTimeVO get admissionDate => _admissionDate;
  void setAdmissionDate(DateTime value) => _admissionDate = DateTimeVO(value);

  TextVO get phone => _phone;
  void setPhone(String value) => _phone = TextVO(value);

  TextVO get image => _image;
  void setImage(String value) => _image = TextVO(value);

  Employee({
    required int id,
    required String name,
    required String job,
    required DateTime admissionDate,
    required String phone,
    required String image,
  })  : _id = IdVO(id),
        _name = TextVO(name),
        _job = TextVO(job),
        _admissionDate = DateTimeVO(admissionDate),
        _phone = TextVO(phone),
        _image = TextVO(image);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employee &&
        other._id == _id &&
        other._name == _name &&
        other._job == _job &&
        other._admissionDate == _admissionDate &&
        other._phone == _phone &&
        other._image == _image;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _name.hashCode ^
        _job.hashCode ^
        _admissionDate.hashCode ^
        _phone.hashCode ^
        _image.hashCode;
  }
}
