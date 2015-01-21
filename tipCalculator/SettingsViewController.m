//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Long Yang on 1/20/15.
//  Copyright (c) 2015 Long Yang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryPercentage;
@property (weak, nonatomic) IBOutlet UITextField *intermPercentage;
@property (weak, nonatomic) IBOutlet UITextField *premiumPercentage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *dayNightControl;

- (void)onDefaultButton;
- (void)updateSettingsValues;
- (void)getLatestPercentageValues;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Default" style:UIBarButtonItemStylePlain target:self action:@selector(onDefaultButton)];
}

- (void)viewWillAppear:(BOOL)animated {
    [self getLatestPercentageValues];
    NSLog(@"SettingsViewController view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"SettingsViewController view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"SettingsViewController view will disappear");
    [self updateSettingsValues];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"SettingsViewController view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onDefaultButton {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"10" forKey:@"entry"];
    [defaults setObject:@"15" forKey:@"interm"];
    [defaults setObject:@"20" forKey:@"premium"];
    [defaults synchronize];
    [self getLatestPercentageValues];
}

- (void)updateSettingsValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.entryPercentage.text forKey:@"entry"];
    [defaults setObject:self.intermPercentage.text forKey:@"interm"];
    [defaults setObject:self.premiumPercentage.text forKey:@"premium"];
    [defaults synchronize];
}

- (void)getLatestPercentageValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.entryPercentage.text = [defaults objectForKey:@"entry"];
    self.intermPercentage.text = [defaults objectForKey:@"interm"];
    self.premiumPercentage.text = [defaults objectForKey:@"premium"];
}

@end
