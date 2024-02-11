import 'package:finwise/database/database_provider.dart';
import 'package:finwise/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finwise/models/user.dart';

class UserNotifier extends AsyncNotifier<User> {
  Future<void> createUser(User user) async {
    final database = ref.read(databaseProvider);
    final account = ref.read(accountProvider);
    final currentUser = await account.get();
    await database.createDocument(
      databaseId: 'database1',
      collectionId: 'users',
      documentId: currentUser.$id,
      data: user.toJson(),
    );
  }

  Future<void> _updateUser(User user) async {
    final database = ref.read(databaseProvider);
    final account = ref.read(accountProvider);
    final currentUser = await account.get();
    database.updateDocument(
      databaseId: 'database1',
      collectionId: 'users',
      documentId: currentUser.$id,
      data: user.toJson(),
    );

    state = AsyncData(user);
  }

  Future<void> updatName(String name) async {
    final user = state.value!.copyWith(name: name);
    await _updateUser(user);
  }

  Future<void> updateEmail(String email) async {
    final user = state.value!.copyWith(email: email);
    await _updateUser(user);
  }

  Future<void> updateAge(int age) async {
    final user = state.value!.copyWith(age: age);
    await _updateUser(user);
  }

  Future<void> updateGender(String gender) async {
    final user = state.value!.copyWith(gender: gender);
    await _updateUser(user);
  }

  Future<void> updateState(String newState) async {
    final user = state.value!.copyWith(state: newState);
    await _updateUser(user);
  }

  Future<void> updateCity(String city) async {
    final user = state.value!.copyWith(city: city);
    await _updateUser(user);
  }

  Future<void> updatePhone(String phone) async {
    final user = state.value!.copyWith(phone: phone);
    await _updateUser(user);
  }

  Future<void> updateProfession(String profession) async {
    final user = state.value!.copyWith(profession: profession);
    await _updateUser(user);
  }

  Future<void> updateMaritalStatus(bool isMarried) async {
    final user = state.value!.copyWith(isMarried: isMarried);
    await _updateUser(user);
  }

  Future<void> updateNumberOfChildrens(int numberOfChildrens) async {
    final user = state.value!.copyWith(numberOfChildrens: numberOfChildrens);
    await _updateUser(user);
  }

  Future<void> updateAnnualIncome(int annualIncome) async {
    final user = state.value!.copyWith(annualIncome: annualIncome);
    await _updateUser(user);
  }

  Future<void> updateFinancialGoals(List<String> financialGoals) async {
    final user = state.value!.copyWith(financialGoals: financialGoals);
    await _updateUser(user);
  }

  Future<void> updateRiskTolerance(String riskTolerance) async {
    final user = state.value!.copyWith(riskTolerance: riskTolerance);
    await _updateUser(user);
  }

  Future<void> updateInvestmentKnowledge(String investmentKnowledge) async {
    final user =
        state.value!.copyWith(investmentKnowledge: investmentKnowledge);
    await _updateUser(user);
  }

  Future<void> updatePreferedLanguage(String preferedLanguage) async {
    final user = state.value!.copyWith(preferedLanguage: preferedLanguage);
    await _updateUser(user);
  }

  Future<void> updateAssets(List<String> assets) async {
    final user = state.value!.copyWith(assets: assets);
    await _updateUser(user);
  }

  Future<void> updateGoals(List<String> goals) async {
    final user = state.value!.copyWith(goals: goals);
    await _updateUser(user);
  }

  Future<void> updateNoOfDependents(int noOfDependents) async {
    final user = state.value!.copyWith(noOfDependents: noOfDependents);
    await _updateUser(user);
  }

  Future<void> updateHasDoneInvestments(bool hasDoneInvestments) async {
    final user = state.value!.copyWith(hasDoneInvestments: hasDoneInvestments);
    await _updateUser(user);
  }

  Future<void> updateHasDebts(bool hasDebts) async {
    final user = state.value!.copyWith(hasDebts: hasDebts);
    await _updateUser(user);
  }

  @override
  Future<User> build() async {
    final userCollection = ref.watch(userCollectionProvider);
    final account = ref.read(accountProvider);
    final accountUser = await account.get();
    final userId = accountUser.$id;

    final userDoc = userCollection.whenData((collection) async {
      return collection.documents.firstWhere((doc) => doc.$id == userId);
    });

    if (userDoc.hasValue) {
      final user = await userDoc.asData!.value;
      return User.fromJson(user.data);
    } else {
      throw Exception('User not found');
    }
  }
}
