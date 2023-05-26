abstract class Account {
  final String id, name, profileImage;

  Account({required this.id, required this.name, required this.profileImage});
   
}

class FreelanceAccount extends Account {
  FreelanceAccount({required super.id, required super.name, required super.profileImage});
  

}

class BusinessAccount extends Account {
  final String company;
  BusinessAccount({required this.company, required super.id, required super.name, required super.profileImage});

}

class EmployeeAccount extends Account {
  EmployeeAccount({required super.id, required super.name, required super.profileImage});
  
}