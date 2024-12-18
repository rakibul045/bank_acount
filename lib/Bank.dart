// ignore: file_names
import 'package:bank_acount/BankAccount.dart';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class Bank {
  List<BankAccount> accounts = [];

  void createAccount(String name, int accountNumber, double initialBalance) {
    BankAccount account = BankAccount(name, accountNumber, initialBalance);
    accounts.add(account);
    print('Account created successfully for $name!');
  }

  BankAccount? findAccount(int accountNumber) {
    return accounts.firstWhereOrNull(
      (account) => account.accountNumber == accountNumber,
    );
  }

  void closeAccount(int accountNumber) {
    accounts.removeWhere((account) => account.accountNumber == accountNumber);
    print('Account $accountNumber closed successfully!');
  }

  void displayAccountDetails(int accountNumber) {
    BankAccount? account = findAccount(accountNumber);
    if (account != null) {
      if (kDebugMode) {
        print('Account Holder: ${account.accountHolderName}');
      }
      if (kDebugMode) {
        print('Account Number: ${account.accountNumber}');
      }
      if (kDebugMode) {
        print('Balance: \$${account.balance.toStringAsFixed(2)}');
      }
    } else {
      if (kDebugMode) {
        print('Account not found!');
      }
    }
  }
}
