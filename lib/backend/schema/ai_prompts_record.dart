import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ai_prompts_record.g.dart';

abstract class AiPromptsRecord
    implements Built<AiPromptsRecord, AiPromptsRecordBuilder> {
  static Serializer<AiPromptsRecord> get serializer =>
      _$aiPromptsRecordSerializer;

  @BuiltValueField(wireName: 'Title')
  String? get title;

  @BuiltValueField(wireName: 'Subtitle')
  String? get subtitle;

  @BuiltValueField(wireName: 'Premium')
  bool? get premium;

  @BuiltValueField(wireName: 'Prompt')
  String? get prompt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AiPromptsRecordBuilder builder) => builder
    ..title = ''
    ..subtitle = ''
    ..premium = false
    ..prompt = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aiPrompts');

  static Stream<AiPromptsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AiPromptsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AiPromptsRecord._();
  factory AiPromptsRecord([void Function(AiPromptsRecordBuilder) updates]) =
      _$AiPromptsRecord;

  static AiPromptsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAiPromptsRecordData({
  String? title,
  String? subtitle,
  bool? premium,
  String? prompt,
}) {
  final firestoreData = serializers.toFirestore(
    AiPromptsRecord.serializer,
    AiPromptsRecord(
      (a) => a
        ..title = title
        ..subtitle = subtitle
        ..premium = premium
        ..prompt = prompt,
    ),
  );

  return firestoreData;
}
