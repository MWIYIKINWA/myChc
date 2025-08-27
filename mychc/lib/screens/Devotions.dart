import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/devotion_controller.dart';
import 'package:mychc/models/devotion_model.dart';

class Devotions extends ConsumerStatefulWidget {
  const Devotions({super.key});

  @override
  ConsumerState<Devotions> createState() => _DevotionsState();
}

class _DevotionsState extends ConsumerState<Devotions> {
  @override
  Widget build(BuildContext context) {
    final devotionsState = ref.watch(devotionControllerProvider);

    return Scaffold(
      body: devotionsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(devotionControllerProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (devotions) {
          if (devotions.isEmpty) {
            return const Center(child: Text('No devotions available'));
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(devotionControllerProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: devotions.length,
              itemBuilder: (context, index) {
                final devotion = devotions[index];
                return DevotionCard(devotion: devotion);
              },
            ),
          );
        },
      ),
    );
  }
}

class DevotionCard extends StatelessWidget {
  final Devotion devotion;

  const DevotionCard({super.key, required this.devotion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              devotion.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Scripture: ${devotion.scripture}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 12),
            Text(devotion.message),
            const SizedBox(height: 12),
            if (devotion.author != null)
              Text(
                'By: ${devotion.author!.name}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            const SizedBox(height: 8),
            Text(
              'Posted: ${devotion.createdAt.toString().split(' ')[0]}',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
