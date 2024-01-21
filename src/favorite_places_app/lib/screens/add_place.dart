import 'dart:io';
import 'dart:math';

import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _savePlace() {
    final enteredText = _titleController.text;

    if (enteredText.isEmpty) {
      showAboutDialog(
          context: context,
          applicationName: 'Error',
          children: [const Text('Please enter a title')]);
      return;
    }

    if (_pickedImage == null) {
      showAboutDialog(
          context: context,
          applicationName: 'Error',
          children: [const Text('Please pick an image')]);
      return;
    }

    if (_pickedLocation == null) {
      showAboutDialog(
          context: context,
          applicationName: 'Error',
          children: [const Text('Please pick a location')]);
      return;
    }

    ref
        .read(userPlacesNotifier.notifier)
        .addPlace(enteredText, _pickedImage!, _pickedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            //Image Input
            ImageInput(
              onPickImage: (image) {
                _pickedImage = image;
              },
            ),
            const SizedBox(height: 10),
            LocationInput(onSelectPlace: (location) {
              _pickedLocation = location;
            }),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
