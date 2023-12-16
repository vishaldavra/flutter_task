class ExpenseModel {
  ExpenseModel({
      this.date, 
      this.amount, 
      this.category, 
      this.description,});

  ExpenseModel.fromJson(dynamic json) {
    date = json['date'];
    amount = json['amount'];
    category = json['category'];
    description = json['description'];
  }
  String? date;
  String? amount;
  String? category;
  String? description;
ExpenseModel copyWith({  String? date,
  String? amount,
  String? category,
  String? description,
}) => ExpenseModel(  date: date ?? this.date,
  amount: amount ?? this.amount,
  category: category ?? this.category,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['amount'] = amount;
    map['category'] = category;
    map['description'] = description;
    return map;
  }

}