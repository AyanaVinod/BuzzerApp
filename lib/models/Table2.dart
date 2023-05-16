/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Table2 type in your schema. */
@immutable
class Table2 extends Model {
  static const classType = const _Table2ModelType();
  final String id;
  final TemporalTime? _TimeStamp;
  final String? _PlayerName;
  final int? _DeviceID;
  final List<Table1>? _Table1s;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  Table2ModelIdentifier get modelIdentifier {
      return Table2ModelIdentifier(
        id: id
      );
  }
  
  TemporalTime? get TimeStamp {
    return _TimeStamp;
  }
  
  String? get PlayerName {
    return _PlayerName;
  }
  
  int? get DeviceID {
    return _DeviceID;
  }
  
  List<Table1>? get Table1s {
    return _Table1s;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Table2._internal({required this.id, TimeStamp, PlayerName, DeviceID, Table1s, createdAt, updatedAt}): _TimeStamp = TimeStamp, _PlayerName = PlayerName, _DeviceID = DeviceID, _Table1s = Table1s, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Table2({String? id, TemporalTime? TimeStamp, String? PlayerName, int? DeviceID, List<Table1>? Table1s}) {
    return Table2._internal(
      id: id == null ? UUID.getUUID() : id,
      TimeStamp: TimeStamp,
      PlayerName: PlayerName,
      DeviceID: DeviceID,
      Table1s: Table1s != null ? List<Table1>.unmodifiable(Table1s) : Table1s);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Table2 &&
      id == other.id &&
      _TimeStamp == other._TimeStamp &&
      _PlayerName == other._PlayerName &&
      _DeviceID == other._DeviceID &&
      DeepCollectionEquality().equals(_Table1s, other._Table1s);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Table2 {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("TimeStamp=" + (_TimeStamp != null ? _TimeStamp!.format() : "null") + ", ");
    buffer.write("PlayerName=" + "$_PlayerName" + ", ");
    buffer.write("DeviceID=" + (_DeviceID != null ? _DeviceID!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Table2 copyWith({TemporalTime? TimeStamp, String? PlayerName, int? DeviceID, List<Table1>? Table1s}) {
    return Table2._internal(
      id: id,
      TimeStamp: TimeStamp ?? this.TimeStamp,
      PlayerName: PlayerName ?? this.PlayerName,
      DeviceID: DeviceID ?? this.DeviceID,
      Table1s: Table1s ?? this.Table1s);
  }
  
  Table2.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _TimeStamp = json['TimeStamp'] != null ? TemporalTime.fromString(json['TimeStamp']) : null,
      _PlayerName = json['PlayerName'],
      _DeviceID = (json['DeviceID'] as num?)?.toInt(),
      _Table1s = json['Table1s'] is List
        ? (json['Table1s'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Table1.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'TimeStamp': _TimeStamp?.format(), 'PlayerName': _PlayerName, 'DeviceID': _DeviceID, 'Table1s': _Table1s?.map((Table1? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'TimeStamp': _TimeStamp, 'PlayerName': _PlayerName, 'DeviceID': _DeviceID, 'Table1s': _Table1s, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<Table2ModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<Table2ModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TIMESTAMP = QueryField(fieldName: "TimeStamp");
  static final QueryField PLAYERNAME = QueryField(fieldName: "PlayerName");
  static final QueryField DEVICEID = QueryField(fieldName: "DeviceID");
  static final QueryField TABLE1S = QueryField(
    fieldName: "Table1s",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Table1).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Table2";
    modelSchemaDefinition.pluralName = "Table2s";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table2.TIMESTAMP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table2.PLAYERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table2.DEVICEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Table2.TABLE1S,
      isRequired: false,
      ofModelName: (Table1).toString(),
      associatedKey: Table1.TABLE2ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _Table2ModelType extends ModelType<Table2> {
  const _Table2ModelType();
  
  @override
  Table2 fromJson(Map<String, dynamic> jsonData) {
    return Table2.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Table2] in your schema.
 */
@immutable
class Table2ModelIdentifier implements ModelIdentifier<Table2> {
  final String id;

  /** Create an instance of Table2ModelIdentifier using [id] the primary key. */
  const Table2ModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'Table2ModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is Table2ModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}