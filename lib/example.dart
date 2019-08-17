// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class _Person {
  final String firstName;
  @JsonKey(includeIfNull: false)
  final String middleName;
  final String lastName;

  @JsonKey(name: 'date-of-birth', nullable: false)
  final DateTime dateOfBirth;

  @JsonKey(name: 'last-order')
  final DateTime lastOrder;

  @JsonKey(nullable: false)
  List<_Order> orders;

  _Person(this.firstName, this.lastName, this.dateOfBirth,
      {this.middleName, this.lastOrder, List<_Order> orders})
      : orders = orders ?? <_Order>[];

  factory _Person.fromJson(Map<String, dynamic> json) => _$_PersonFromJson(json);

  Map<String, dynamic> toJson() => _$_PersonToJson(this);
}

@JsonSerializable(includeIfNull: false)
class _Order {
  int count;
  int itemNumber;
  bool isRushed;
  _Item item;

  @JsonKey(
      name: 'prep-time',
      fromJson: _durationFromMilliseconds,
      toJson: _durationToMilliseconds)
  Duration prepTime;

  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime date;

  _Order(this.date);

  factory _Order.fromJson(Map<String, dynamic> json) => _$_OrderFromJson(json);

  Map<String, dynamic> toJson() => _$_OrderToJson(this);

  static Duration _durationFromMilliseconds(int milliseconds) =>
      milliseconds == null ? null : Duration(milliseconds: milliseconds);

  static int _durationToMilliseconds(Duration duration) =>
      duration?.inMilliseconds;

  static DateTime _dateTimeFromEpochUs(int us) =>
      us == null ? null : DateTime.fromMicrosecondsSinceEpoch(us);

  static int _dateTimeToEpochUs(DateTime dateTime) =>
      dateTime?.microsecondsSinceEpoch;
}

@JsonSerializable()
class _Item {
  int count;
  int itemNumber;
  bool isRushed;

  _Item();

  factory _Item.fromJson(Map<String, dynamic> json) => _$_ItemFromJson(json);

  Map<String, dynamic> toJson() => _$_ItemToJson(this);
}
