//
//  main.m
//  ClassesAndObjectsPairProject
//
//  Created by Z on 6/21/15.
//  Copyright (c) 2015 dereknetto. All rights reserved.
//

#import <Foundation/Foundation.h>

//Bank Account Class
@interface BankAccount : NSObject

- (void)deposit:(int)amountToDeposit;
- (void)withdraw:(int)amountToWithdraw;

- (void)checkBalance;
- (void)setBalance:(int)balanceToSet;

- (instancetype)initWithBonus:(int)b;

@end

@implementation BankAccount{
    int balance;
}

- (instancetype)initWithBonus:(int)b {
    if (self = [super init]) {
        balance = 100;
        return self;
    }
    return nil;
}

- (void)setBalance:(int)balanceToSet{
    balance = balance + balanceToSet;
}

- (void)deposit:(int)amountToDeposit{
    balance = amountToDeposit + balance;
}

- (void)withdraw:(int)amountToWithdraw{
    balance = balance - amountToWithdraw;
}

- (void)checkBalance{
    NSLog(@"The balance is $%d.", balance);
}

- (int)getBalance{
    return balance;
}

@end

//Patron Class
@interface Patron : NSObject

-(void)makeDeposit:(int)amountToDeposit IntoAccount:(int)accountAwaitingDeposit;
-(void)makeWithdrawl:(int)amountToWithdraw FromAccount:(int)accountToWithdrawFrom;

-(void)checkPocket;

-(void)setBankAccount:(BankAccount*)account;
-(void)setPocket:(int)moneyInPocket;

@end

@implementation Patron {
    BankAccount *myAccounts[3]; //a patron can have a max of 3 accounts
    NSString *name;
    int pocket;
}

- (instancetype)initWithName:(NSString*)patronName {
    if (self = [super init]) {
        name = patronName;
        return self;
    }
    return nil;
}

-(void)setBankAccount:(BankAccount*)account{
//    for (int i = 0; i < 3; i++) {
//        
//        if (myAccounts[i] == nil) {
//            
//            myAccounts[i] = account; //set the last available account
//            NSLog(@"Account %d was successfully set.",i);
//            break;
//        }
//        else {
//            NSLog(@"Account %d is already in use.",i);
//        }
//    }
    int accountNumber = 0;
    
    if (myAccounts[0] == nil || myAccounts[1] == nil || myAccounts[2] == nil ) {
        NSLog(@"Enter an account number: 0, 1, or 2:");
        scanf("%d",&accountNumber);
        
        if (myAccounts[accountNumber] == nil) {
            myAccounts[accountNumber] = account;
            NSLog(@"Account %d successfully set!",accountNumber);
        }
        else {
            NSLog(@"Error. Account %d is already in use!",accountNumber);
        }
        
    }
    else {
        NSLog(@"Error. All accounts in use!");
    }

}

-(void)setPocket:(int)moneyInPocket{
    pocket = moneyInPocket;
}

-(void)checkPocket{
    NSLog(@"%@ has $%d in his pocket.",name, pocket);
}

-(void)makeDeposit:(int)amountToDeposit IntoAccount:(int)accountAwaitingDeposit{
    if (amountToDeposit <= pocket){
        pocket -= amountToDeposit;
        [myAccounts[accountAwaitingDeposit] deposit:amountToDeposit];
        NSLog(@"%@ deposited $%d.",name,amountToDeposit);
    }
    else {
        NSLog(@"Invalid transaction.");
    }

}

-(void)makeWithdrawl:(int)amountToWithdraw FromAccount:(int)accountToWithdrawFrom{
    
    int myBalance = [myAccounts[accountToWithdrawFrom] getBalance];
    
    if (myBalance >= amountToWithdraw){
        pocket += amountToWithdraw;
        [myAccounts[accountToWithdrawFrom] withdraw:amountToWithdraw];
        NSLog(@"%@ withdrew $%d.",name,amountToWithdraw);
    }
    else {
        NSLog(@"OVERDRAFT. INVALID WITHDRAWL!");
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *kenFamilyAccount = [[BankAccount alloc] initWithBonus:100];
        BankAccount *kenCollegeFund = [[BankAccount alloc] initWithBonus:500];
        BankAccount *kenSavings = [[BankAccount alloc] initWithBonus:2];
        BankAccount *kenVacation = [[BankAccount alloc] initWithBonus:0];
        
        Patron *kenneth = [[Patron alloc] initWithName:@"Kenneth"];
        [kenneth setBankAccount:kenFamilyAccount];
        [kenneth setBankAccount:kenCollegeFund];
        [kenneth setBankAccount:kenSavings];
        [kenneth setBankAccount:kenVacation];
        
        Patron *coco = [[Patron alloc] initWithName:@"Coco"];
        [coco setBankAccount:kenFamilyAccount];
        
    }
    return 0;
}
