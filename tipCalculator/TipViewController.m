//
//  TipViewController.m
//  tipCalculator
//
//  Created by Long Yang on 1/20/15.
//  Copyright (c) 2015 Long Yang. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)OnTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculate";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"TipViewController view will appear");
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *tipValues = @[
                           [NSString stringWithFormat:@"%@%%", [defaults objectForKey:@"entry"]],
                           [NSString stringWithFormat:@"%@%%", [defaults objectForKey:@"interm"]],
                           [NSString stringWithFormat:@"%@%%", [defaults objectForKey:@"premium"]],
                           ];
    for (int i = 0; i < 3; i++) {
        [self.tipControl setTitle:tipValues[i] forSegmentAtIndex:i];
    }
    
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount / 100.0;
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
