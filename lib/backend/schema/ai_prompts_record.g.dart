// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_prompts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AiPromptsRecord> _$aiPromptsRecordSerializer =
    new _$AiPromptsRecordSerializer();

class _$AiPromptsRecordSerializer
    implements StructuredSerializer<AiPromptsRecord> {
  @override
  final Iterable<Type> types = const [AiPromptsRecord, _$AiPromptsRecord];
  @override
  final String wireName = 'AiPromptsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AiPromptsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('Title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('Subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.premium;
    if (value != null) {
      result
        ..add('Premium')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.prompt;
    if (value != null) {
      result
        ..add('Prompt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AiPromptsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AiPromptsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Premium':
          result.premium = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Prompt':
          result.prompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AiPromptsRecord extends AiPromptsRecord {
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final bool? premium;
  @override
  final String? prompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AiPromptsRecord([void Function(AiPromptsRecordBuilder)? updates]) =>
      (new AiPromptsRecordBuilder()..update(updates))._build();

  _$AiPromptsRecord._(
      {this.title, this.subtitle, this.premium, this.prompt, this.ffRef})
      : super._();

  @override
  AiPromptsRecord rebuild(void Function(AiPromptsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiPromptsRecordBuilder toBuilder() =>
      new AiPromptsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiPromptsRecord &&
        title == other.title &&
        subtitle == other.subtitle &&
        premium == other.premium &&
        prompt == other.prompt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), subtitle.hashCode),
                premium.hashCode),
            prompt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiPromptsRecord')
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('premium', premium)
          ..add('prompt', prompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AiPromptsRecordBuilder
    implements Builder<AiPromptsRecord, AiPromptsRecordBuilder> {
  _$AiPromptsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  bool? _premium;
  bool? get premium => _$this._premium;
  set premium(bool? premium) => _$this._premium = premium;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AiPromptsRecordBuilder() {
    AiPromptsRecord._initializeBuilder(this);
  }

  AiPromptsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _subtitle = $v.subtitle;
      _premium = $v.premium;
      _prompt = $v.prompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiPromptsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AiPromptsRecord;
  }

  @override
  void update(void Function(AiPromptsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiPromptsRecord build() => _build();

  _$AiPromptsRecord _build() {
    final _$result = _$v ??
        new _$AiPromptsRecord._(
            title: title,
            subtitle: subtitle,
            premium: premium,
            prompt: prompt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
