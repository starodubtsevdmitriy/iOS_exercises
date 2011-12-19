//
//  CalculatorFunctions.m
//  PrefernsCalc
//
//  Created by Dmitriy Starodubtsev on 06.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorFunctions.h"
@interface CalculatorFunctions ()

@property (nonatomic) double operandF1;
@property (nonatomic) double operandF2;
@property (nonatomic, strong) NSString * operation;
@end

@implementation CalculatorFunctions

@synthesize operandF1 = _operandF1;
@synthesize operandF2 = _operandF2;
@synthesize operation;

- (void)setCurrentOperation:(NSString *) currentoperation {
    operation = currentoperation;
}

- (double)functionsOperation {
    double result;
  
    if ([operation isEqualToString:@"+"]) {
        result = self.operandF1 + self.operandF2;
    }
    if ([operation isEqualToString:@"-"]) {
        result = self.operandF1 - self.operandF2;
    }
    if ([operation isEqualToString:@"X"]) {
        result = self.operandF1 * self.operandF2;
    }
    if ([operation isEqualToString:@"/"]) {
        result = self.operandF1 / self.operandF2;
    }
    if ([operation isEqualToString:@"="]) {
        return result;
    }
    return result;
}

- (void) setOperand1:(double)operand1{
    self.operandF1 = operand1;
}

- (void) setOperand2:(double)operand2{
    self.operandF2 = operand2;
}

@end
