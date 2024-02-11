class User {
  final String id;
  final String name;
  final String? email;
  final int age;
  final String gender;
  final String? state;
  final String? city;
  final String phone;
  final String profession;
  final bool isMarried;
  final int? numberOfChildrens;
  final int annualIncome;
  final List<String>? financialGoals;
  final String? riskTolerance;
  final String? investmentKnowledge;
  final String? preferedLanguage;
  final List<String>? assets;
  final int? noOfDependents;
  final List<String>? goals;
  final bool? hasDoneInvestments;
  final bool? hasDebts;

  User({
    required this.id,
    required this.name,
    this.email,
    required this.age,
    required this.gender,
    this.state,
    this.city,
    required this.phone,
    required this.profession,
    required this.isMarried,
    this.numberOfChildrens,
    required this.annualIncome,
    this.financialGoals,
    this.riskTolerance,
    this.investmentKnowledge,
    this.preferedLanguage,
    this.assets,
    this.goals,
    this.noOfDependents,
    this.hasDoneInvestments,
    this.hasDebts,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      age: json['data']['age'],
      annualIncome: json['data']['annualIncome'],
      gender: json['data']['gender'],
      phone: json['data']['phone'],
      profession: json['data']['profession'],
      isMarried: json['data']['isMarried'],
      numberOfChildrens: json['data']['numberOfChildrens'],
      state: json['data']['state'],
      city: json['data']['city'],
      financialGoals: json['data']['financialGoals'],
      riskTolerance: json['data']['riskTolerance'],
      investmentKnowledge: json['data']['investmentKnowledge'],
      preferedLanguage: json['data']['preferedLanguage'],
      assets: json['data']['assets'],
      goals: json['data']['goals'],
      noOfDependents: json['data']['noOfDependents'],
      hasDoneInvestments: json['data']['hasDoneInvestments'],
      hasDebts: json['data']['hasDebts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'state': state,
      'city': city,
      'phone': phone,
      'profession': profession,
      'isMarried': isMarried,
      'numberOfChildrens': numberOfChildrens,
      'annualIncome': annualIncome,
      'financialGoals': financialGoals,
      'riskTolerance': riskTolerance,
      'investmentKnowledge': investmentKnowledge,
      'preferedLanguage': preferedLanguage,
      'assets': assets,
      'goals': goals,
      'noOfDependents': noOfDependents,
      'hasDoneInvestments': hasDoneInvestments,
      'hasDebts': hasDebts,
    };
  }

  User copyWith({
    String? name,
    String? email,
    int? age,
    String? gender,
    String? state,
    String? city,
    String? phone,
    String? profession,
    bool? isMarried,
    int? numberOfChildrens,
    int? annualIncome,
    List<String>? financialGoals,
    String? riskTolerance,
    String? investmentKnowledge,
    String? preferedLanguage,
    List<String>? assets,
    int? noOfDependents,
    List<String>? goals,
    bool? hasDoneInvestments,
    bool? hasDebts,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      annualIncome: annualIncome ?? this.annualIncome,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      profession: profession ?? this.profession,
      isMarried: isMarried ?? this.isMarried,
      numberOfChildrens: numberOfChildrens ?? this.numberOfChildrens,
      state: state ?? this.state,
      city: city ?? this.city,
      financialGoals: financialGoals ?? this.financialGoals,
      riskTolerance: riskTolerance ?? this.riskTolerance,
      investmentKnowledge: investmentKnowledge ?? this.investmentKnowledge,
      preferedLanguage: preferedLanguage ?? this.preferedLanguage,
      assets: assets ?? this.assets,
      goals: goals ?? this.goals,
      noOfDependents: noOfDependents ?? this.noOfDependents,
      hasDoneInvestments: hasDoneInvestments ?? this.hasDoneInvestments,
      hasDebts: hasDebts ?? this.hasDebts,
    );
  }
}
