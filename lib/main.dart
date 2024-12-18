import 'dart:io';
import 'package:bank_acount/BankAccount.dart';
import 'package:bank_acount/Bank.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  Bank bank = Bank();

  while (true) {
    if (kDebugMode) {
      print('\n--- Bank System Menu ---');
    }
    if (kDebugMode) {
      print('1. Create Account');
    }
    if (kDebugMode) {
      print('2. Deposit Money');
    }
    if (kDebugMode) {
      print('3. Withdraw Money');
    }
    if (kDebugMode) {
      print('4. Display Account Details');
    }
    if (kDebugMode) {
      print('5. Display Transaction History');
    }
    if (kDebugMode) {
      print('6. Close Account');
    }
    if (kDebugMode) {
      print('7. Exit');
    }
    if (kDebugMode) {
      print('Enter your choice:');
    }
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        if (kDebugMode) {
          print('Enter the account holder’s name:');
        }
        String name = stdin.readLineSync()!;

        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);

        if (kDebugMode) {
          print('Enter the initial balance:');
        }
        double balance = double.parse(stdin.readLineSync()!);

        bank.createAccount(name, accountNumber, balance);
        break;

      case 2:
        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);

        if (kDebugMode) {
          print('Enter the deposit amount:');
        }
        double amount = double.parse(stdin.readLineSync()!);

        BankAccount? account = bank.findAccount(accountNumber);
        if (account != null) {
          account.deposit(amount);
          if (kDebugMode) {
            print('Deposit successful!');
          }
        } else {
          if (kDebugMode) {
            print('Account not found!');
          }
        }
        break;

      case 3:
        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);

        if (kDebugMode) {
          print('Enter the withdrawal amount:');
        }
        double amount = double.parse(stdin.readLineSync()!);

        BankAccount? account = bank.findAccount(accountNumber);
        if (account != null) {
          account.withdraw(amount);
          if (kDebugMode) {
            print('Withdrawal successful!');
          }
        } else {
          if (kDebugMode) {
            print('Account not found!');
          }
        }
        break;

      case 4:
        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);
        bank.displayAccountDetails(accountNumber);
        break;

      case 5:
        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);

        BankAccount? account = bank.findAccount(accountNumber);
        if (account != null) {
          account.displayTransactionHistory();
        } else {
          if (kDebugMode) {
            print('Account not found!');
          }
        }
        break;

      case 6:
        if (kDebugMode) {
          print('Enter the account number:');
        }
        int accountNumber = int.parse(stdin.readLineSync()!);
        bank.closeAccount(accountNumber);
        break;

      case 7:
        if (kDebugMode) {
          print('Thank you for using the bank system. Goodbye!');
        }
        return;

      default:
        if (kDebugMode) {
          print('Invalid choice! Please try again.');
        }
    }
  }
}
