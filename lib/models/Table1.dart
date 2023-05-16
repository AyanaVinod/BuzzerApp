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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Table1 type in your schema. */
@immutable
class Table1 extends Model {
  static const classType = const _Table1ModelType();
  final String id;
  final String? _PlayerName;
  final String? _PinNumber;
  final int? _TimeLimit;
  final int? _NumofPlayers;
  final String? _table2ID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  Table1ModelIdentifier get modelIdentifier {
      return Table1ModelIdentifier(
        id: id
      );
  }
  
  String? get PlayerName {
    return _PlayerName;
  }
  
  String? get PinNumber {
    return _PinNumber;
  }
  
  int? get TimeLimit {
    return _TimeLimit;
  }
  
  int? get NumofPlayers {
    return _NumofPlayers;
  }
  
  String get table2ID {
    try {
      return _table2ID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Table1._internal({required this.id, PlayerName, PinNumber, TimeLimit, NumofPlayers, required table2ID, createdAt, updatedAt}): _PlayerName = PlayerName, _PinNumber = PinNumber, _TimeLimit = TimeLimit, _NumofPlayers = NumofPlayers, _table2ID = table2ID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Table1({String? id, String? PlayerName, String? PinNumber, int? TimeLimit, int? NumofPlayers, required String table2ID}) {
    return Table1._internal(
      id: id == null ? UUID.getUUID() : id,
      PlayerName: PlayerName,
      PinNumber: PinNumber,
      TimeLimit: TimeLimit,
      NumofPlayers: NumofPlayers,
      table2ID: table2ID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Table1 &&
      id == other.id &&
      _PlayerName == other._PlayerName &&
      _PinNumber == other._PinNumber &&
      _TimeLimit == other._TimeLimit &&
      _NumofPlayers == other._NumofPlayers &&
      _table2ID == other._table2ID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Table1 {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("PlayerName=" + "$_PlayerName" + ", ");
    buffer.write("PinNumber=" + "$_PinNumber" + ", ");
    buffer.write("TimeLimit=" + (_TimeLimit != null ? _TimeLimit!.toString() : "null") + ", ");
    buffer.write("NumofPlayers=" + (_NumofPlayers != null ? _NumofPlayers!.toString() : "null") + ", ");
    buffer.write("table2ID=" + "$_table2ID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Table1 copyWith({String? PlayerName, String? PinNumber, int? TimeLimit, int? NumofPlayers, String? table2ID}) {
    return Table1._internal(
      id: id,
      PlayerName: PlayerName ?? this.PlayerName,
      PinNumber: PinNumber ?? this.PinNumber,
      TimeLimit: TimeLimit ?? this.TimeLimit,
      NumofPlayers: NumofPlayers ?? this.NumofPlayers,
      table2ID: table2ID ?? this.table2ID);
  }
  
  Table1.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _PlayerName = json['PlayerName'],
      _PinNumber = json['PinNumber'],
      _TimeLimit = (json['TimeLimit'] as num?)?.toInt(),
      _NumofPlayers = (json['NumofPlayers'] as num?)?.toInt(),
      _table2ID = json['table2ID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'PlayerName': _PlayerName, 'PinNumber': _PinNumber, 'TimeLimit': _TimeLimit, 'NumofPlayers': _NumofPlayers, 'table2ID': _table2ID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'PlayerName': _PlayerName, 'PinNumber': _PinNumber, 'TimeLimit': _TimeLimit, 'NumofPlayers': _NumofPlayers, 'table2ID': _table2ID, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<Table1ModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<Table1ModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PLAYERNAME = QueryField(fieldName: "PlayerName");
  static final QueryField PINNUMBER = QueryField(fieldName: "PinNumber");
  static final QueryField TIMELIMIT = QueryField(fieldName: "TimeLimit");
  static final QueryField NUMOFPLAYERS = QueryField(fieldName: "NumofPlayers");
  static final QueryField TABLE2ID = QueryField(fieldName: "table2ID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Table1";
    modelSchemaDefinition.pluralName = "Table1s";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["table2ID"], name: "byTable2")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table1.PLAYERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table1.PINNUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table1.TIMELIMIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table1.NUMOFPLAYERS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Table1.TABLE2ID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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

class _Table1ModelType extends ModelType<Table1> {
  const _Table1ModelType();
  
  @override
  Table1 fromJson(Map<String, dynamic> jsonData) {
    return Table1.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Table1] in your schema.
 */
@immutable
class Table1ModelIdentifier implements ModelIdentifier<Table1> {
  final String id;

  /** Create an instance of Table1ModelIdentifier using [id] the primary key. */
  const Table1ModelIdentifier({
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
  String toString() => 'Table1ModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is Table1ModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}