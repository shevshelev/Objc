//
//  PowerOfTwoViewController.m
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

#import "PowerOfTwoViewController.h"
#import "Objc-Swift.h"

@interface PowerOfTwoViewController ()
@property (strong, nonatomic) IBOutlet UILabel *powerLabel;
@property (strong, nonatomic) IBOutlet UITextField *powerTF;

@end

@implementation PowerOfTwoViewController

- (IBAction)buttonPressed:(id)sender {
    CheckValue *check = [CheckValue alloc];
    bool *checkResult = [check checkIntFromStringWithString:_powerTF.text];

    if (checkResult) {
        int powerValue = [self getPower:[_powerTF.text intValue]];
        NSString *number = [[NSString alloc] initWithFormat:@"%d", powerValue];
        _powerLabel.text = number;
    } else {
        _powerLabel.text = @"Введите целое число в строку";
    }
}

- (int)getPower: (int)power {
    if (power < 1) {
        return 1;
    } else {
        int firstPower = 2;
        int step = 1;
        for (nil; step < power; step++) {
            firstPower = firstPower * 2;
        }
        return firstPower;
    }
}


@end
