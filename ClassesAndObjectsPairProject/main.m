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
//- (void)setPatron:(Patron)patronToSet;

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

- (void)deposit:(int)amountToDeposit{
    balance = amountToDeposit + balance;
}

- (void)withdraw:(int)amountToWithdraw{
    balance = balance - amountToWithdraw;
}

- (void)checkBalance{
    NSLog(@"The balance is: $%d.", balance);
}

@end

//Patron Class
@interface Patron : NSObject

-(void)makeDeposit:(int)amountToDeposit;
-(void)makeWithdrawl:(int)amountToWithdraw;

-(void)checkPocket;

-(void)setBankAccount:(BankAccount*)account;
-(void)setPocket:(int)moneyInPocket;

@end

@implementation Patron {
    //    NSString *name;
    //    int pocket;
    int accountNumber;  //private
    BankAccount *myAccount;
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
    myAccount = account;
}

-(void)setPocket:(int)moneyInPocket{
    pocket = moneyInPocket;
}

-(void)checkPocket{
    NSLog(@"%@ has $%d in his pocket.",name, pocket);
}

-(void)makeDeposit:(int)amountToDeposit{
    pocket -= amountToDeposit;
    [myAccount deposit:amountToDeposit];
    NSLog(@"%@ deposited $%d.",name,amountToDeposit);
}

-(void)makeWithdrawl:(int)amountToWithdraw{
    pocket += amountToWithdraw;
    [myAccount withdraw:amountToWithdraw];
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *kenFamilyAccount = [[BankAccount alloc] initWithBonus:100];
        
        Patron *kenneth = [[Patron alloc] initWithName:@"Kenneth"];
        [kenneth setBankAccount:kenFamilyAccount];
        
        [kenneth checkPocket];
        [kenFamilyAccount checkBalance];
        
        [kenneth setPocket:45];
        [kenneth makeDeposit:10];
        [kenFamilyAccount checkBalance];
        [kenneth checkPocket];
        
    }
    return 0;
}
