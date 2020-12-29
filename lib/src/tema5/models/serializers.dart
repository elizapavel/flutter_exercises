library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:first_flutter_app/src/tema5/models/movie.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[Movie])
Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
