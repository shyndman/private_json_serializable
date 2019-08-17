// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Person _$_PersonFromJson(Map<String, dynamic> json) {
  return _Person(
    json['firstName'] as String,
    json['lastName'] as String,
    DateTime.parse(json['date-of-birth'] as String),
    middleName: json['middleName'] as String,
    lastOrder: json['last-order'] == null
        ? null
        : DateTime.parse(json['last-order'] as String),
    orders: (json['orders'] as List)
        .map((e) => _Order.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_PersonToJson(_Person instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middleName', instance.middleName);
  val['lastName'] = instance.lastName;
  val['date-of-birth'] = instance.dateOfBirth.toIso8601String();
  val['last-order'] = instance.lastOrder?.toIso8601String();
  val['orders'] = instance.orders;
  return val;
}

_Order _$_OrderFromJson(Map<String, dynamic> json) {
  return _Order(
    _Order._dateTimeFromEpochUs(json['date'] as int),
  )
    ..count = json['count'] as int
    ..itemNumber = json['itemNumber'] as int
    ..isRushed = json['isRushed'] as bool
    ..item = json['item'] == null
        ? null
        : _Item.fromJson(json['item'] as Map<String, dynamic>)
    ..prepTime = _Order._durationFromMilliseconds(json['prep-time'] as int);
}

Map<String, dynamic> _$_OrderToJson(_Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('itemNumber', instance.itemNumber);
  writeNotNull('isRushed', instance.isRushed);
  writeNotNull('item', instance.item);
  writeNotNull('prep-time', _Order._durationToMilliseconds(instance.prepTime));
  writeNotNull('date', _Order._dateTimeToEpochUs(instance.date));
  return val;
}

_Item _$_ItemFromJson(Map<String, dynamic> json) {
  return _Item()
    ..count = json['count'] as int
    ..itemNumber = json['itemNumber'] as int
    ..isRushed = json['isRushed'] as bool;
}

Map<String, dynamic> _$_ItemToJson(_Item instance) => <String, dynamic>{
      'count': instance.count,
      'itemNumber': instance.itemNumber,
      'isRushed': instance.isRushed,
    };
