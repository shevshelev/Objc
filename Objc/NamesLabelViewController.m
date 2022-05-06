//
//  NamesLabelViewController.m
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

#import "NamesLabelViewController.h"


@interface NamesLabelViewController ()
@property (strong, nonatomic) IBOutlet UILabel *namesLabel;
@property (strong, nonatomic) IBOutlet UITextField *namesTF;

@end

@implementation NamesLabelViewController
- (IBAction)buttonPressed:(id)sender {
    NSString *tempText = [[NSString alloc] initWithString:[_namesTF.text stringByAppendingString:@" "]];
    tempText = [tempText stringByAppendingString:_namesLabel.text];
    _namesLabel.text = tempText;
    _namesTF.text = @"";
}
@end
