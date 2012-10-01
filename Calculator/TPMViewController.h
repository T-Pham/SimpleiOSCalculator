//
//  TPMViewController.h
//  Calculator
//
//  Created by East Agile on 10/1/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPMViewController : UIViewController
{
    IBOutlet UILabel *screenField;
    NSMutableString *lhs;
    NSMutableString *rhs;
    NSMutableString *opt;
    NSMutableString *chs;
}

- (IBAction)acButtonPressed:(id)sender;
- (IBAction)numberButtonPressed:(id)sender;
- (IBAction)operationButtonPressed:(id)sender;
- (IBAction)pointButtonPressed:(id)sender;
- (IBAction)plusMinusButtonPressed:(id)sender;
- (IBAction)enterButtonPressed:(id)sender;

@end
