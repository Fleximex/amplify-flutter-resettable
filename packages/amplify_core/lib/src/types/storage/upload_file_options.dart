// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'base/storage_operation_options.dart';

/// {@template amplify_core.storage.upload_file_options}
/// Configurable options to initiate a [StorageUploadFileRequest].
/// {@endtemplate}
class StorageUploadFileOptions extends StorageOperationOptions {
  /// {@macro amplify_core.storage.upload_file_options}
  const StorageUploadFileOptions({
    required super.accessLevel,
  });
}