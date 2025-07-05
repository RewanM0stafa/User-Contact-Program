

class Contact {
  int contactId;
  String name;
  String phone;
  String email;
  String address;
  String notes;

  Contact({
    required this.contactId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.notes,
  });


  void viewContact() {
    print('[$contactId] $name | $phone | $email | $address | $notes');
  }
}








/*

Contact
- contact_id
- user_id
- name
- phone_number
- email
- address
- notes
=display contact
 */