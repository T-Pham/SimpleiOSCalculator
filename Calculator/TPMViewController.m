//
//  TPMViewController.m
//  Calculator
//
//  Created by East Agile on 10/1/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "TPMViewController.h"

@interface TPMViewController ()

@end

@implementation TPMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lhs = [[NSMutableString alloc] init];
    rhs = [[NSMutableString alloc] init];
    opt = [[NSMutableString alloc] initWithCapacity:1];
    chs = lhs;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateScreen
{
    if (![lhs compare:@""]) {
        [screenField setText:@"0"];
    } else {
        [screenField setText:[NSString stringWithFormat:@"%@%@%@", lhs, opt, rhs]];
    }
}

- (void)acButtonPressed:(id)sender
{
    [lhs setString:@""];
    [rhs setString:@""];
    [opt setString:@""];
    chs = lhs;
    [self updateScreen];
}

- (void)numberButtonPressed:(id)sender
{
    [chs appendString:[[sender titleLabel] text]];
    [self updateScreen];
}

- (void)operationButtonPressed:(id)sender
{
    [self minusCheck];
    if (![lhs compare:@""]) [lhs setString:@"0"];
    if ((chs == rhs) && ([rhs compare:@""])) {
        [lhs setString:[NSString stringWithFormat:@"%g", [self calculate]]];
        [rhs setString:@""];
    } else chs = rhs;
    [opt setString:[[sender titleLabel] text]];
    [self updateScreen];
}

- (IBAction)pointButtonPressed:(id)sender
{
    NSString *point = [[sender titleLabel] text];
    if ((![chs compare:@""]) || (![chs compare:@"-"])) [chs appendString:@"0"];
    if ([chs rangeOfString:point].location == NSNotFound) [chs appendString:point];
    [self updateScreen];
}

- (IBAction)plusMinusButtonPressed:(id)sender
{
    NSString *minus = @"-";
    if ([chs rangeOfString:minus].location == NSNotFound) [chs insertString:minus atIndex:0];
    else [chs deleteCharactersInRange:NSRangeFromString(@"{0, 1}")];
    [self updateScreen];
}

- (IBAction)enterButtonPressed:(id)sender
{
    [self minusCheck];
    if ((chs == rhs) && ([rhs compare:@""])) {
        [lhs setString:[NSString stringWithFormat:@"%@%@%@=%g", lhs, opt, rhs, [self calculate]]];
        [rhs setString:@""];
        [opt setString:@""];
        [self updateScreen];
        chs = lhs;
        [lhs setString:@""];
        return;
    }
    [self updateScreen];
}

- (void)minusCheck
{
    if (![lhs compare:@"-"]) [lhs setString:@"0"];
    if (![rhs compare:@"-"]) [rhs setString:@"0"];
}

- (double)calculate
{
    if ((![lhs compare:@""]) || (![rhs compare:@""]) || (![opt compare:@""])) return 0;
    double lhs_d = [lhs doubleValue];
    double rhs_d = [rhs doubleValue];
    if (![opt compare:@"+"]) return lhs_d + rhs_d;
    if (![opt compare:@"-"]) return lhs_d - rhs_d;
    if (![opt compare:@"×"]) return lhs_d * rhs_d;
    if (![opt compare:@"÷"]) return lhs_d / rhs_d;
    return 0; // should never run
}

@end
