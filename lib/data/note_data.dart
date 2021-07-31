import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';

class NoteData {
  NoteData._();

  static NoteData noteData = NoteData._();

  int colorHexCode = 0xFF0E121B;
  String title;
  String description;
  String imagePath;
  Category category;
  List<ItemCheck> itemsCheck;

  List<Note> notes = [
    Note(
        id: '11',
        title: 'Balance',
        // imagePath: 'assets/images/note.jpg',
        // category: Category(title: 'Obaida', id: '55'),
        itemsCheck: [
          ItemCheck(title: 'Canada', isDone: true),
          ItemCheck(title: 'Finland', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
        ],
        // description:
        //     'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
    ),
    Note(
      id: '11',
      title: 'Balance',
      imagePath: 'assets/images/note.jpg',
      category: Category(title: 'Obaida', id: '55'),
      // itemsCheck: [
      //   ItemCheck(title: 'Canada', isDone: true),
      //   ItemCheck(title: 'Finland', isDone: false),
      //   ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
      //   ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
      //   ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
      // ],
      description:
          'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
    Note(
        id: '11',
        title: 'Balance',
        colorHexCode: 0xFF3269FF,
        imagePath: 'assets/images/note.jpg',
        itemsCheck: [
          ItemCheck(title: 'Canada', isDone: true),
          ItemCheck(title: 'Finland', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
        ],
        category: Category(title: 'Obaida', id: '55'),
        description:
            'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
    Note(
        id: '11',
        title: 'Balance',
        colorHexCode: 0xFFAE3B76,
        itemsCheck: [
          ItemCheck(title: 'Canada', isDone: true),
          ItemCheck(title: 'Finland', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
        ],
        category: Category(title: 'Obaida', id: '55'),
        description:
            'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
    Note(
        id: '11',
        title: 'Balance',
        imagePath: 'assets/images/note.jpg',
        category: Category(title: 'Obaida', id: '55'),
        itemsCheck: [
          ItemCheck(title: 'Canada', isDone: true),
          ItemCheck(title: 'Finland', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
        ],
        description:
            'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
    Note(
        id: '11',
        title: 'Balance',
        imagePath: 'assets/images/note.jpg',
        itemsCheck: [
          ItemCheck(title: 'Canada', isDone: true),
          ItemCheck(title: 'Finland', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: true),
          ItemCheck(title: 'Obaodjagajsiodjv', isDone: false),
        ],
        description:
            'The Jews who descended from Abraham were never really the nation we associate with and build a great empire like the Romans did or build large monuments like the Egyptians did with the pyramids. Their fame comes from the Law and Book which they wrote; from some remarkable individuals that were Jewish; and that they have survived as a somewhat different people group for thousands of years.  Their greatness is not because of anything they did, but rather'),
  ];

  List<Category> categories = [
    Category(id: '22',title: 'Flutter'),
    Category(id: '22',title: 'Design'),
    Category(id: '22',title: 'Maps'),
    Category(id: '22',title: 'UI'),
    Category(id: '22',title: 'Wep'),
    Category(id: '22',title: 'Flutter'),
    Category(id: '22',title: 'Design'),
  ];

  // Get All Notes
  List<Note> getAllNotes() {
    return notes;
  }


  List<Category>getAllCategories(){
    return categories;
  }
}
