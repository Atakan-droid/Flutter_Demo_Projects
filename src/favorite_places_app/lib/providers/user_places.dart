import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final dbInstance = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT,lat REAL, lng REAL, address TEXT)');
    },
    version: 1,
  );

  return dbInstance;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  Future<void> loadPlaces() async {
    final dbInstance = await _getDatabase();
    final placesData = await dbInstance.query('user_places');

    final places = placesData
        .map((row) => Place(
              id: row['id'] as String,
              title: row['title'] as String,
              image: File(row['image'] as String),
              location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lng'] as double,
                address: row['address'] as String,
              ),
            ))
        .toList();

    state = places;
  }

  Future<void> addPlace(
      String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final place = Place(title: title, image: copiedImage, location: location);
    final dbInstance = await _getDatabase();
    dbInstance.insert(
        'user_places',
        {
          'id': place.id,
          'title': place.title,
          'image': place.image.path,
          'lat': place.location.latitude,
          'lng': place.location.longitude,
          'address': place.location.address,
        },
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    state = [...state, place];
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
