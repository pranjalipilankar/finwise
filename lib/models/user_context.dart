class UserContext {
  final String name;
  final int age;
  final String profession;
  final MaritalStatus maritalStatus;
  final int numberOfChildrens;
  final int annualIncome;
  final String financialGoals;
  final RiskTolerance riskTolerance;
  final InvestmentKnowledge investmentKnowledge;
  final String preferedLanguage;

  UserContext({
    required this.name,
    required this.age,
    required this.profession,
    required this.maritalStatus,
    required this.numberOfChildrens,
    required this.annualIncome,
    required this.financialGoals,
    required this.riskTolerance,
    required this.investmentKnowledge,
    required this.preferedLanguage,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) {
    return UserContext(
      name: json['name'],
      age: json['age'],
      profession: json['profession'],
      maritalStatus: MaritalStatus.values[json['maritalStatus']],
      numberOfChildrens: json['numberOfChildrens'],
      annualIncome: json['annualIncome'],
      financialGoals: json['financialGoals'],
      riskTolerance: RiskTolerance.values[json['riskTolerance']],
      investmentKnowledge:
          InvestmentKnowledge.values[json['investmentKnowledge']],
      preferedLanguage: json['preferedLanguage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'profession': profession,
      'maritalStatus': maritalStatus.name,
      'numberOfChildrens': numberOfChildrens,
      'annualIncome': annualIncome,
      'financialGoals': financialGoals,
      'riskTolerance': riskTolerance.name,
      'investmentKnowledge': investmentKnowledge.name,
      'preferedLanguage': preferedLanguage,
    };
  }
}

enum MaritalStatus { married, unmarried }

enum RiskTolerance { low, medium, high }

enum InvestmentKnowledge { none, basic, intermediate, expert }
