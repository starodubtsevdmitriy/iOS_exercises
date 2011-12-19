//
//  CalculatorFunctions.h
//  PrefernsCalc
//
//  Created by Dmitriy Starodubtsev on 06.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorFunctions : NSObject

- (void)setOperand1:(double) operand1;
- (void)setOperand2:(double) operand2;
- (void)setCurrentOperation:(NSString *) currentoperation;
- (double)functionsOperation;

@end
