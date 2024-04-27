import 'package:flutter/material.dart';
import '../models/candidate.dart';
import 'candidate_tile.dart';
import 'add_candidate_page.dart';

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidate> candidates = [];
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Election'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: candidates.map((candidate) => CandidateTile(candidate: candidate)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCandidatePage()),
          ).then((newCandidate) {
            if (newCandidate != null) {
              setState(() {
                candidates.add(newCandidate);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Candidates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
