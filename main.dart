import 'user.dart';
import 'contact.dart';

void main() {
  // إنشاء مستخدم
  User user = User(
    userId: 1,
    username: 'Rewan',
    email: 'rewan@example.com',
    password: '1234',
  );

  // إضافة جهات اتصال
  user.addContact(Contact(
    contactId: 101,
    name: 'Mona',
    phone: '01123456789',
    email: 'mona@gmail.com',
    address: 'Cairo',
    notes: 'College friend',
  ));

  user.addContact(Contact(
    contactId: 102,
    name: 'Ahmed',
    phone: '01234567890',
    email: 'ahmed@gmail.com',
    address: 'Giza',
    notes: 'Work colleague',
  ));

  print('\nView all contacts:');
  user.viewContacts();

  // تعديل جهة اتصال (Edit)
  user.editContact(101, Contact(
    contactId: 101, //بعدل ع نفس الcontact
    name: 'Mona Ali',
    phone: '01000000000',
    email: 'mona.ali@example.com',
    address: 'Alexandria',
    notes: 'Updated contact',
  ));

  print('\nView after edit:');
  user.viewContacts();

  // استبدال جهة اتصال (Replace)
  user.replaceContact(102, Contact( // بستبدل contact
    contactId: 102,
    name: 'Ahmed Zaki',
    phone: '01012345678',
    email: 'ahmed.zaki@example.com',
    address: 'Mansoura',
    notes: 'New version of Ahmed',
  ));

  print('\n View after replace:');
  user.viewContacts();

  // بحث عن جهة اتصال
  var results = user.searchContact('mona');
  if (results.isEmpty) {
    print('No matches');
  } else {
    for (var c in results) {
      c.viewContact();
    }
  }
  // حذف جهة اتصال
  print('\nDeleting contact with ID 101:');
  user.deleteContact(101);

  print('\nFinal contact list:');
  user.viewContacts();
}