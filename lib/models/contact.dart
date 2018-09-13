class Contact {
  String name, phone, email, whatsapp;

  Contact(this.name, this.phone, this.email, this.whatsapp);

  Contact.fromJson(var value) {
    this.name = value['name'];
    this.phone = value['phone'];
    this.email = value['email'];
    this.whatsapp = value['whatsapp'];
  }
}
