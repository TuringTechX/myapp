// lib/models/LearningModuleModel.dart
class LearningModuleModel {
  final String title;
  final String description;
  final double progress;
  final String content;
  final bool completed;

  LearningModuleModel({
    required this.title,
    required this.description,
    required this.progress,
    required this.content,
    required this.completed,
  });
}

// lib/models/ForumThreadModel.dart
class ForumThreadModel {
  final String title;
  final String author;
  final DateTime createdDate;
  final List<String> posts;

  ForumThreadModel({
    required this.title,
    required this.author,
    required this.createdDate,
    required this.posts,
  });
}

// lib/models/GamifiedChallengeModel.dart
class GamifiedChallengeModel {
  final String title;
  final String description;
  final String reward;
  final String status;

  GamifiedChallengeModel({
    required this.title,
    required this.description,
    required this.reward,
    required this.status,
  });
}

// lib/data/repositories/CommunityRepository.dart
class CommunityRepository {
  // Mock data for learning modules
  List<LearningModuleModel> fetchLearningModules() {
    return [
      LearningModuleModel(
        title: 'Climate Change 101',
        description: 'Basics of climate change and its global impact',
        progress: 0.6,
        content: 'Content for Climate Change 101',
        completed: false,
      ),
      LearningModuleModel(
        title: 'Healthcare Innovation',
        description: 'Advancements in global healthcare',
        progress: 1.0,
        content: 'Content for Healthcare Innovation',
        completed: true,
      ),
    ];
  }

  // Mock data for forum threads
  List<ForumThreadModel> fetchForumThreads() {
    return [
      ForumThreadModel(
        title: 'Sustainability Ideas',
        author: 'John Doe',
        createdDate: DateTime.now(),
        posts: ['Great idea!', 'Thanks for sharing!'],
      ),
      ForumThreadModel(
        title: 'Healthcare Solutions',
        author: 'Jane Smith',
        createdDate: DateTime.now().subtract(Duration(days: 1)),
        posts: ['This is insightful!'],
      ),
    ];
  }

  // Mock data for gamified challenges
  List<GamifiedChallengeModel> fetchChallenges() {
    return [
      GamifiedChallengeModel(
        title: 'Plant Trees Challenge',
        description: 'Participate in planting trees to combat climate change.',
        reward: '10 Carbon Credits',
        status: 'Ongoing',
      ),
      GamifiedChallengeModel(
        title: 'Healthcare Awareness',
        description: 'Promote healthcare awareness in your community.',
        reward: '5 Health Points',
        status: 'Completed',
      ),
    ];
  }
}

// lib/controllers/CommunityProvider.dart
import 'package:flutter/material.dart';
import '../models/LearningModuleModel.dart';
import '../models/ForumThreadModel.dart';
import '../models/GamifiedChallengeModel.dart';
import '../data/repositories/CommunityRepository.dart';

class CommunityProvider with ChangeNotifier {
  final CommunityRepository repository = CommunityRepository();

  List<LearningModuleModel> _learningModules = [];
  List<ForumThreadModel> _forumThreads = [];
  List<GamifiedChallengeModel> _challenges = [];

  List<LearningModuleModel> get learningModules => _learningModules;
  List<ForumThreadModel> get forumThreads => _forumThreads;
  List<GamifiedChallengeModel> get challenges => _challenges;

  void fetchCommunityData() {
    _learningModules = repository.fetchLearningModules();
    _forumThreads = repository.fetchForumThreads();
    _challenges = repository.fetchChallenges();
    notifyListeners();
  }
}

// lib/screens/CommunityScreen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/CommunityProvider.dart';
import '../widgets/Community/LearningModuleWidget.dart';
import '../widgets/Community/ForumThreadWidget.dart';
import '../widgets/Community/GamifiedChallengeWidget.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Engagement & Education'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CommunityProvider()..fetchCommunityData(),
        child: Consumer<CommunityProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  LearningModuleWidget(modules: provider.learningModules),
                  ForumThreadWidget(threads: provider.forumThreads),
                  GamifiedChallengeWidget(challenges: provider.challenges),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// lib/widgets/Community/LearningModuleWidget.dart
import 'package:flutter/material.dart';
import '../../models/LearningModuleModel.dart';

class LearningModuleWidget extends StatelessWidget {
  final List<LearningModuleModel> modules;

  LearningModuleWidget({required this.modules});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: modules.map((module) {
        return Card(
          child: ListTile(
            title: Text(module.title),
            subtitle: Text(module.description),
            trailing: Icon(
              module.completed ? Icons.check_circle : Icons.pending,
              color: module.completed ? Colors.green : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// lib/widgets/Community/ForumThreadWidget.dart
import 'package:flutter/material.dart';
import '../../models/ForumThreadModel.dart';

class ForumThreadWidget extends StatelessWidget {
  final List<ForumThreadModel> threads;

  ForumThreadWidget({required this.threads});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: threads.map((thread) {
        return Card(
          child: ListTile(
            title: Text(thread.title),
            subtitle: Text('Started by ${thread.author}'),
          ),
        );
      }).toList(),
    );
  }
}

// lib/widgets/Community/GamifiedChallengeWidget.dart
import 'package:flutter/material.dart';
import '../../models/GamifiedChallengeModel.dart';

class GamifiedChallengeWidget extends StatelessWidget {
  final List<GamifiedChallengeModel> challenges;

  GamifiedChallengeWidget({required this.challenges});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: challenges.map((challenge) {
        return Card(
          child: ListTile(
            title: Text(challenge.title),
            subtitle: Text(challenge.description),
            trailing: Text(challenge.status),
          ),
        );
      }).toList(),
    );
  }
}
