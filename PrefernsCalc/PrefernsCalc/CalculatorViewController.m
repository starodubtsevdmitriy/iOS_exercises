//
//  CalculatorViewController.m
//  PrefernsCalc
//
//  Created by Dmitriy Starodubtsev on 04.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorFunctions.h"

@interface CalculatorViewController()

@property (nonatomic, strong) CalculatorFunctions * functions;
@property (nonatomic) BOOL inMiddleOfEnterNumbes;
@property (nonatomic) BOOL currentOperationExist;
@property (nonatomic) BOOL dotAlredyPressed;
@end

@implementation CalculatorViewController

@synthesize currentOperationExist;
@synthesize inMiddleOfEnterNumbes;
@synthesize calculatorDisplay;
@synthesize dotAlredyPressed;
@synthesize functions = _functions;

- (void)checkDotAlredyPressed {
    if ([self.calculatorDisplay.text rangeOfString:@"."].location == NSNotFound) {
        self.dotAlredyPressed = NO;
    }
    else {
        self.dotAlredyPressed = YES;
    }
}

- (CalculatorFunctions *)functions {
    if (!_functions)_functions = [[CalculatorFunctions alloc] init];
    return _functions;
}

- (IBAction)buttonDigitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    [self checkDotAlredyPressed];
    if ([digit isEqualToString:@"0"] == YES && self.inMiddleOfEnterNumbes == NO) {
        self.calculatorDisplay.text = digit;
    }
    else if (self.inMiddleOfEnterNumbes) {
        self.calculatorDisplay.text = [self.calculatorDisplay.text stringByAppendingString:digit];
    }
    else {
        self.calculatorDisplay.text = digit;
        self.inMiddleOfEnterNumbes = YES;
    }
}

- (IBAction)buttonDotPressed:(id)sender {
    [self checkDotAlredyPressed];
    if (self.dotAlredyPressed == NO) {
        self.calculatorDisplay.text = [self.calculatorDisplay.text stringByAppendingString:@"."];
   //   self.dotAlredyPressed = YES;
        self.inMiddleOfEnterNumbes = YES;
    }
}

- (IBAction)buttonOperationPressed:(UIButton *)sender {
    [self checkDotAlredyPressed];
    NSString * operation = sender.currentTitle;
    if (self.currentOperationExist == NO && [operation isEqualToString:@"="] != YES) {
        [self.functions setOperand1:self.calculatorDisplay.text.doubleValue];
        self.currentOperationExist = YES;
        [self.functions setCurrentOperation:operation];

    }
    else if (self.currentOperationExist == YES) {
        if ([operation isEqualToString:@"="] == YES) {
            [self.functions setOperand2:self.calculatorDisplay.text.doubleValue];
            double result = [self.functions functionsOperation];
            self.calculatorDisplay.text = [NSString stringWithFormat:@"%g", result];
            [self.functions setOperand1: self.calculatorDisplay.text.doubleValue];
            self.currentOperationExist = NO;
        //  self.dotAlredyPressed = NO;
            self.inMiddleOfEnterNumbes = NO;
        }
        else {
            [self.functions setOperand2: self.calculatorDisplay.text.doubleValue];
            double result = [self.functions functionsOperation];
            self.calculatorDisplay.text = [NSString stringWithFormat:@"%g", result];
            [self.functions setOperand1: self.calculatorDisplay.text.doubleValue];
            [self.functions setCurrentOperation:operation];
         // self.dotAlredyPressed = NO;
            self.inMiddleOfEnterNumbes = NO;
            self.currentOperationExist = YES;

        }
       
    }
    self.inMiddleOfEnterNumbes = NO;
}

- (IBAction)cancelInput:(id)sender {
    if (self.calculatorDisplay.text.length > 0) {
        self.calculatorDisplay.text = [self.calculatorDisplay.text substringToIndex: self.calculatorDisplay.text.length - 1];
        if ([self.calculatorDisplay.text rangeOfString: @"."].location == NSNotFound) self.dotAlredyPressed = NO;
        if (self.calculatorDisplay.text.length == 0) {
            self.calculatorDisplay.text = @"0";
            self.inMiddleOfEnterNumbes = NO;
        }
        else if (self.calculatorDisplay.text.length == 1 && [self.calculatorDisplay.text isEqualToString: @"0"]) {
            self.inMiddleOfEnterNumbes = NO;
        }
    }
    
}

- (IBAction)cancelOperation:(id)sender {
    currentOperationExist = NO;
    self.calculatorDisplay.text = @"0";
    inMiddleOfEnterNumbes = NO;
    dotAlredyPressed = NO;

}

@end
