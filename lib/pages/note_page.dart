import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/services/crud/crud.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // text controller
  final TextEditingController textController = TextEditingController();
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                // button to save
                ElevatedButton(
                  onPressed: () {
                    // add a new note
                    if(docID == null){
                      firestoreService.addNote(textController.text);
                    }
                    // update an existing note
                    else{
                      firestoreService.updateNote(docID, textController.text);
                    }
                    // clear the text controller
                    textController.clear();
                    // close the box
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text("Notes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openNoteBox,
          child: Icon(
            Icons.add,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            // if we have date ,get all doc
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              // display as a list
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  // get each individual docs
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id;

                  // get note from each doc
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String noteText = data['note'];

                  // display as a list tile
                  return ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      children: [
                        // update
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: Icon(Icons.settings),
                        ),
                        // delete
                         IconButton(
                          onPressed: () => firestoreService.deleteNote(docID),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Text("No notes...");
            }
          },
          // if there is no data return nothing
        ));
  }
}
