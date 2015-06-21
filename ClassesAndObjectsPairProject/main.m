//
//  main.m
//  ClassesAndObjectsPairProject
//
//  Created by Z on 6/21/15.
//  Copyright (c) 2015 dereknetto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

- (void)deposit:(int)amountToDeposit;
- (void)withdraw:(int)amountToWithdraw;
- (void)checkBalance;

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
    NSLog(@"Your balance is: %d", balance);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *account1 = [[BankAccount alloc] initWithBonus:100];
        [account1 checkBalance];
        
        
        
        
        
    }
    return 0;
}
