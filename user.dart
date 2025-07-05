import 'contact.dart';

class User {
  int userId;
  String username;
  String email;
  String password;
  List<Contact> contacts = [];

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
  });


  void addContact(Contact contact) {
    contacts.add(contact);
    print('Contact added: ${contact.name}');
  }


  void editContact(int contactId, Contact updatedContact) {
    var existing = _findContactById(contactId);
    if (existing != null) {
      existing.name = updatedContact.name;
      existing.phone = updatedContact.phone;
      existing.email = updatedContact.email;
      existing.address = updatedContact.address;
      existing.notes = updatedContact.notes;
      print('Contact updated: ${updatedContact.name}');
    } else {
      print('Contact not found!');
    }
  }


//بستخدم ال id علشان ألاقى الcontact
// بخزن ال index بتاعه علشان أشاور به ع الexisting وأعمللها assign ب contact آخر
  void replaceContact(int contactId, Contact replacedContact) {
    var existing = _findContactById(contactId);
    if (existing != null) {
      int index = contacts.indexOf(existing);
      contacts[index] = replacedContact;
      print('Contact replaced : ${replacedContact.name}');
    } else {
      print('Contact not found!');
    }
  }


  void deleteContact(int contactId) {
    var contact = _findContactById(contactId);
    if (contact != null) {
      contacts.remove(contact);
      print('Contact deleted: ${contact.name}');
    } else {
      print('Contact not found!');
    }
  }

  List<Contact> searchContact(String query) {
    return contacts.where((c) =>
    c.name.toLowerCase().contains(query.toLowerCase()) ||
        c.phone.contains(query)).toList();
  }



  void viewContacts() {
    if (contacts.isEmpty) {
      print('No contacts found.');
      return;
    }
    print('Your Contacts:');
    for (var contact in contacts) {
      contact.viewContact();
    }
  }


  bool authenticate(String inputEmail, String inputPassword) {
    return email == inputEmail && password == inputPassword;
  }


  // common method used in edit,delete,search
  // => using for loop
  Contact? _findContactById(int id) {
    for (var contact in contacts) {
      if (contact.contactId == id) return contact;
    }
    return null;
  }

}


/*

//using list method
  Contact? _findContactById(int id) {
    return contacts.firstWhere(
          (c) => c.contactId == id,
      orElse: () => null,
    );
  }

   */

/*
User
- userId
- userName
- email
- password

=> add,edit,replace,delete,search,login contact
 */
