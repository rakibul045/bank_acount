// ignore: file_names
import 'package:flutter/foundation.dart';

class BankAccount {
  final String _accountHolderName;
  final int _accountNumber;
  double _balance;
  final List<String> _transactionHistory = [];

  BankAccount(this._accountHolderName, this._accountNumber, this._balance) {
    _transactionHistory
        .add('Account created with balance: \$${_balance.toStringAsFixed(2)}');
  }

  String get accountHolderName => _accountHolderName;
  int get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      _transactionHistory.add('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      if (kDebugMode) {
        print('Invalid deposit amount!');
      }
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      _transactionHistory.add('Withdrew: \$${amount.toStringAsFixed(2)}');
      if (kDebugMode) {
        print(
            'Withdrawal successful! Remaining balance: \$${_balance.toStringAsFixed(2)}');
      }
    } else {
      if (kDebugMode) {
        print('Invalid withdrawal amount or insufficient balance!');
      }
    }
  }

  void displayTransactionHistory() {
    if (kDebugMode) {
      print('Transaction History for Account $_accountNumber:');
    }
    if (_transactionHistory.isEmpty) {
      if (kDebugMode) {
        print('No transactions available.');
      }
    } else {
      for (String transaction in _transactionHistory) {
        if (kDebugMode) {
          print('- $transaction');
        }
      }
    }
  }
}
