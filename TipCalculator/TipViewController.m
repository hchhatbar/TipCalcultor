//
//  TipViewController.m
//  TipCalculator
//
//  Created by Hemen Chhatbar on 2/18/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void) upDateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    // Do any additional setup after loading the view from its nib.
    [self upDateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self upDateValues];
}


- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (void)upDateValues{
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    
    float tipAmount =  billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
        self.totalLabel.text = [NSString stringWithFormat:@"%0.2f",totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"defaultTipIndex"];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    if(intValue >= 0)
    {
        NSLog(@"if greater than 0");
        self.tipControl.selectedSegmentIndex = intValue;
        
    }
    NSString *myNewString = [NSString stringWithFormat:@"%i", intValue];
    NSLog(myNewString);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
