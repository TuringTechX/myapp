// lib/screens/Home/HomeScreen.dart

import 'package:flutter/material.dart';
import 'components/QuickAccessCard.dart';
import 'components/RealTimeUpdateCard.dart';
import 'components/KeyMetricTile.dart';
import 'services/RealTimeUpdateService.dart';
import 'services/FeedService.dart';
import 'models/FeedItem.dart';
import 'models/KeyMetric.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aeonexus'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/user-avatar.png'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildPersonalizedFeed(),
          SizedBox(height: 16.0),
          _buildQuickAccess(),
          SizedBox(height: 16.0),
          _buildRealTimeUpdates(),
          SizedBox(height: 16.0),
          _buildKeyMetrics(),
        ],
      ),
    );
  }

  Widget _buildPersonalizedFeed() {
    return FutureBuilder<List<FeedItem>>(
      future: FeedService().getFeedItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading feed.');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No feed items available.');
        }
        final feedItems = snapshot.data!;
        return SizedBox(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: feedItems.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150.0,
                margin: EdgeInsets.only(right: 16.0),
                child: Card(
                  child: Column(
                    children: [
                      Image.network(feedItems[index].imageUrl),
                      Text(feedItems[index].title),
                    ],
                  ),
                ),
              );
            },
          ),
        );
  }

  Widget _buildQuickAccess() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(4, (index) {
        return QuickAccessCard(title: 'Access ${index + 1}');
      }),
    );
  }

  Widget _buildRealTimeUpdates() {
    return FutureBuilder<List<RealTimeUpdate>>(
      future: RealTimeUpdateService().getRealTimeUpdates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading real-time updates.');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No updates available.');
        }
        final updates = snapshot.data!;
        return Column(
          children: updates.map((update) {
            return RealTimeUpdateCard(update: update);
          }).toList(),
        );
      },
    );
  }

  Widget _buildKeyMetrics() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(4, (index) {
        return KeyMetricTile(title: 'Metric ${index + 1}');
      }),
    );
  }
}
