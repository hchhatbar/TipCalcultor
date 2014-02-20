//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Hemen Chhatbar on 2/19/14.
//  Copyright (c) 2014 Hemen Chhatbar. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSettingControl;

//- (IBAction)onTap:(id)sender;
- (void) setDefaultValues;
- (IBAction)defaultTipSelected:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)defaultTipSelected:(id)sender {
    [self.view endEditing:YES];
    [self setDefaultValues];
}

- (void)setDefaultValues{

    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    
    //float defaultTipPercent =  [tipValues[self.tipSettingControl.selectedSegmentIndex] floatValue];
    int selectedTipIndex = self.tipSettingControl.selectedSegmentIndex;
    
    NSString *myNewString = [NSString stringWithFormat:@"%i", selectedTipIndex];
    NSLog(myNewString);

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //[defaults setFloat:defaultTipPercent forKey:@"defaultTip"];
    [defaults setInteger:selectedTipIndex forKey:@"defaultTipIndex"];
    [defaults synchronize];
   
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear1");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"defaultTipIndex"];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    NSString *myNewString = [NSString stringWithFormat:@"%i", intValue];
    NSLog(myNewString);
    
    if(intValue >= 0)
    {
        NSLog(@"if greater than equal 0");
        self.tipSettingControl.selectedSegmentIndex = intValue;
        
    }
    else
    {
        self.tipSettingControl.selectedSegmentIndex = 0;
    }
  
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear1");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear1");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear1");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
