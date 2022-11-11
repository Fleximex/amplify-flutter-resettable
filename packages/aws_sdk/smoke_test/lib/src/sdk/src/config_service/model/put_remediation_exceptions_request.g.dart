// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.config_service.model.put_remediation_exceptions_request;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PutRemediationExceptionsRequest
    extends PutRemediationExceptionsRequest {
  @override
  final String configRuleName;
  @override
  final DateTime? expirationTime;
  @override
  final String? message;
  @override
  final _i4.BuiltList<_i3.RemediationExceptionResourceKey> resourceKeys;

  factory _$PutRemediationExceptionsRequest(
          [void Function(PutRemediationExceptionsRequestBuilder)? updates]) =>
      (new PutRemediationExceptionsRequestBuilder()..update(updates))._build();

  _$PutRemediationExceptionsRequest._(
      {required this.configRuleName,
      this.expirationTime,
      this.message,
      required this.resourceKeys})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        configRuleName, r'PutRemediationExceptionsRequest', 'configRuleName');
    BuiltValueNullFieldError.checkNotNull(
        resourceKeys, r'PutRemediationExceptionsRequest', 'resourceKeys');
  }

  @override
  PutRemediationExceptionsRequest rebuild(
          void Function(PutRemediationExceptionsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutRemediationExceptionsRequestBuilder toBuilder() =>
      new PutRemediationExceptionsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutRemediationExceptionsRequest &&
        configRuleName == other.configRuleName &&
        expirationTime == other.expirationTime &&
        message == other.message &&
        resourceKeys == other.resourceKeys;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, configRuleName.hashCode), expirationTime.hashCode),
            message.hashCode),
        resourceKeys.hashCode));
  }
}

class PutRemediationExceptionsRequestBuilder
    implements
        Builder<PutRemediationExceptionsRequest,
            PutRemediationExceptionsRequestBuilder> {
  _$PutRemediationExceptionsRequest? _$v;

  String? _configRuleName;
  String? get configRuleName => _$this._configRuleName;
  set configRuleName(String? configRuleName) =>
      _$this._configRuleName = configRuleName;

  DateTime? _expirationTime;
  DateTime? get expirationTime => _$this._expirationTime;
  set expirationTime(DateTime? expirationTime) =>
      _$this._expirationTime = expirationTime;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  _i4.ListBuilder<_i3.RemediationExceptionResourceKey>? _resourceKeys;
  _i4.ListBuilder<_i3.RemediationExceptionResourceKey> get resourceKeys =>
      _$this._resourceKeys ??=
          new _i4.ListBuilder<_i3.RemediationExceptionResourceKey>();
  set resourceKeys(
          _i4.ListBuilder<_i3.RemediationExceptionResourceKey>? resourceKeys) =>
      _$this._resourceKeys = resourceKeys;

  PutRemediationExceptionsRequestBuilder() {
    PutRemediationExceptionsRequest._init(this);
  }

  PutRemediationExceptionsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _configRuleName = $v.configRuleName;
      _expirationTime = $v.expirationTime;
      _message = $v.message;
      _resourceKeys = $v.resourceKeys.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PutRemediationExceptionsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutRemediationExceptionsRequest;
  }

  @override
  void update(void Function(PutRemediationExceptionsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutRemediationExceptionsRequest build() => _build();

  _$PutRemediationExceptionsRequest _build() {
    _$PutRemediationExceptionsRequest _$result;
    try {
      _$result = _$v ??
          new _$PutRemediationExceptionsRequest._(
              configRuleName: BuiltValueNullFieldError.checkNotNull(
                  configRuleName,
                  r'PutRemediationExceptionsRequest',
                  'configRuleName'),
              expirationTime: expirationTime,
              message: message,
              resourceKeys: resourceKeys.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resourceKeys';
        resourceKeys.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PutRemediationExceptionsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas